import 'dart:io';

import 'package:alz_aware/core/api/errors/failure.dart';

import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../domain/repositories/result_from_image_repo.dart';
import '../datasources/remote_datasources/result_from_image_remote_datasources.dart';

@Injectable(as: ResultFromImageRepo)
class ResultFromImageRepoImpl implements ResultFromImageRepo {
  final ResultFromImageRemoteDataSource resultFromImageRemoteDataSource;
  const ResultFromImageRepoImpl(this.resultFromImageRemoteDataSource);
  @override
  Future<Either<Failure, String>> getPredict(
      File? image
  ) async {
    try {
      final result = await resultFromImageRemoteDataSource.getPredict(image);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
