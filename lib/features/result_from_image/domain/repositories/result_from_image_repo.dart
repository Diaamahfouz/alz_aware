import 'dart:io';

import 'package:alz_aware/core/api/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract interface class ResultFromImageRepo {
  Future<Either<Failure, String>> getPredict(File? image);
}
