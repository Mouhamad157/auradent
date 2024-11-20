import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failure.dart';


abstract class BaseUseCase<T, Parameters extends Equatable> {
  const BaseUseCase();
  Future<Either<Failure, T>> call(Parameters parameters);
}

abstract class NoParametersBaseUseCase<T> extends BaseUseCase<T,NoParameters> {
  Future<Either<Failure, T>> call([NoParameters parameters = const NoParameters()]);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object> get props => [];
}

class PaginationParameters extends Equatable {
  final int size;
  final int pageNumber;
  const PaginationParameters({required this.pageNumber,this.size=10});

  @override
  List<Object?> get props => [pageNumber,size];
}

abstract class JsonPrams extends Equatable{
  Map<String,dynamic> get json;
}