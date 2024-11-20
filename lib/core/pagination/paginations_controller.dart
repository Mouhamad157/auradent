import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../enums/request_status.dart';
import '../errors/failure.dart';
import '../network/request_state.dart';
import '../usecase/base_use_case.dart';

abstract class PaginationController<T> extends GetxController {
  int pageNumber = 1;

  int get pageSize => parameters.size;
  final BaseUseCase<List<T>, PaginationParameters> useCase;

  PaginationParameters get parameters =>
      PaginationParameters(pageNumber: pageNumber);

  bool _lock = false;

  PaginationController(this.useCase);

  late GetDataState<List<T>> currentState;
  late GetDataState<List<T>> _tempState;

  List<T> get data => currentState.data!;

  bool get done => _tempState.requestStatus == RequestStatus.success;
  late VoidCallback _scrollEvent;

  void reset() {
    _lock = false;
    pageNumber = 1;
    currentState = GetDataState<List<T>>();
    _tempState = GetDataState<List<T>>();
  }

  //double _pos = 0.0;
  //
  // @override
  // void update([List<Object>? ids, bool condition = true]) {
  //   print(_pos);
  //   super.update(ids,condition);
  //   print(_pos);
  //   try{
  //     scrollController.jumpTo(_pos);
  //     print('object');
  //   }catch(e){}
  // }

  @override
  void onInit() {
    super.onInit();
    currentState = GetDataState<List<T>>();
    _tempState = GetDataState<List<T>>();
    _scrollEvent = () async {
      //_pos = scrollController.offset;
      if (scrollController.position.pixels >=
          (scrollController.position.maxScrollExtent - 50)) {
        bool isTop = scrollController.position.pixels == 0;
        if (/*!isTop &&*/ !_lock) {
          _lock = true;
          await load();
          _lock = false;
        }
      }
    };
    scrollController.addListener(_scrollEvent);

    load();
  }

  final ScrollController scrollController = ScrollController();

  @protected
  Future<Either<Failure, List<T>>> apiCall();

  bool isStillLoading() {
    return _tempState.requestStatus == RequestStatus.loading;
  }

  Future<void> load() async {
    if (done) return;
    switch (currentState.requestStatus) {
      case RequestStatus.success:
        final result = await apiCall();
        result.fold((l) {
          _tempState = _tempState.copyWith(
              message: l.message, requestStatus: RequestStatus.error);
          update();
        }, (r) {
          _tempState =
              _tempState.copyWith(requestStatus: RequestStatus.success);
          currentState.data?.addAll(r);
          update();
          pageNumber = pageNumber + 1;
          if (r.length >= pageSize) {
            _tempState =
                _tempState.copyWith(requestStatus: RequestStatus.loading);
          }
        });
        break;
      default:
        final result = await apiCall();
        result.fold((l) {
          currentState = currentState.copyWith(
              message: l.message, requestStatus: RequestStatus.error);
        }, (r) {
          pageNumber = pageNumber + 1;
          currentState = currentState.copyWith(
              data: r, requestStatus: RequestStatus.success);
        });
        update();
        break;
    }
    if (currentState.requestStatus == RequestStatus.success &&
        _tempState.requestStatus != RequestStatus.error) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollEvent());
    }
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollEvent);
    scrollController.dispose();
    super.dispose();
  }
}
