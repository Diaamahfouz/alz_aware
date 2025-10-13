import 'package:dartz/dartz.dart';

import '../api/errors/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
