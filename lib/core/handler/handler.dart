import 'package:dartz/dartz.dart';
import '../errors/exeptions.dart';
import '../errors/failure.dart';

typedef _fun<T> = Future<T> Function();

Future<Either<Failure, T>> handle<T>(_fun<T> future) async {
  try {
    final result = await future();
    return Right(result);
  } on ServerException catch (failure) {
    return Left(ServerFailure(failure.errorMessageModel.statusMessage));
  } on NoInternetException catch (_) {
    return Left(NoInternetFailure());
  } catch (e) {
    return Left(Failure(e.toString()));
  }
}
