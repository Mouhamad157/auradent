

import '../words/words.dart';
import 'error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;
  final int? code;
  const ServerException(this.errorMessageModel,this.code);
}

class NoInternetException implements Exception {
  final String message = ErrorWords.noInternet;
  const NoInternetException();
}
