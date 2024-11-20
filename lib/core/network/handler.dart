import '../enums/request_status.dart';
import '../general_components/popups.dart';
import '../words/words.dart';
import '../storage/storage_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../errors/exeptions.dart';
import '../errors/failure.dart';

typedef _Fun<T> = Future<T> Function();

Future<Either<Failure, T>> handle<T>(_Fun<T> future,
    {bool logout = false,String successMassage ='',String errorMassage =''}) async {
  try {
    final result = await future();
    Get.log(successMassage);
    return Right(result);
  } on ServerException catch (failure) {
    if (logout) {
      await StorageHandler().removeToken();
    }
    Get.log('$errorMassage\n error :${failure.errorMessageModel.statusMessage}');
    return Left(ServerFailure(failure.errorMessageModel.statusMessage));
  } on NoInternetException catch (_) {
    Get.log('$errorMassage\n error : No Internet connection');
    return const Left(NoInternetFailure());
  } catch (e) {
    Get.log('$errorMassage\n error :${e.toString()}');
    return Left(Failure(e.toString()));
  }
}

void everHandler(VoidCallback? onSuccess,
    {required RequestStatus requestStatus, required String message}) {
  if (requestStatus == RequestStatus.success) {
    if (onSuccess != null) {
      Get.back();
      onSuccess();
    } else {
      _showSuccess(ErrorWords.success);
    }
  }
  if (requestStatus == RequestStatus.error) {
    _showError(message);
  }
  if (requestStatus == RequestStatus.loading) {
    _showLoader();
  }
}

void _showLoader() => showLoader();

void _showError(String message) {
  Get.back();
  showSnackBar(message);
}

void _showSuccess(String message) {
  Get.back();
  showSnackBar(message);
}
