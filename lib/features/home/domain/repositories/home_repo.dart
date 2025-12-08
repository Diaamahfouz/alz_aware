import 'package:alz_aware/core/api/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract interface class HomeRepo {
  Future<Either<Failure, String>> getPredict();
}
