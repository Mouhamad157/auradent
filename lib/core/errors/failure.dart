import 'package:equatable/equatable.dart';
import '../words/words.dart';

class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class NoInternetFailure extends Failure{
 const NoInternetFailure():super(ErrorWords.noInternet);
}

class LocationFailure extends Failure{
  const LocationFailure():super('fail to find location');
}