import 'package:equatable/equatable.dart';
import '../enums/request_status.dart';

class GetDataState<T> extends Equatable {
  final RequestStatus requestStatus;
  final String message;
  final T? data;

  const GetDataState({
    this.data,
    this.requestStatus = RequestStatus.loading,
    this.message = '',
  });

  @override
  List<Object?> get props => [data, RequestStatus, message];

  GetDataState<T> copyWith({
    RequestStatus? requestStatus,
    String? message,
    T? data,
  }) {
    return GetDataState<T>(
      requestStatus: requestStatus ?? this.requestStatus,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  GetDataState<T> setDataLoading() {
    return copyWith(requestStatus: RequestStatus.loading);
  }

  GetDataState<T> setDataSuccess(T newData) {
    return copyWith(requestStatus: RequestStatus.success, data: newData);
  }

  GetDataState<T> setDataError(String newMessage) {
    return copyWith(requestStatus: RequestStatus.error, message: newMessage);
  }
}
