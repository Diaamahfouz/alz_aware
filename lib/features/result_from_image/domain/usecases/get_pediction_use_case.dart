import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/api/errors/failure.dart';
import 'package:injectable/injectable.dart';

import '../repositories/result_from_image_repo.dart';

@injectable
class GetPredictionUseCase {
  final ResultFromImageRepo resultFromImageRepo;
  const GetPredictionUseCase({required this.resultFromImageRepo});

  Future<Either<Failure, String>> call(File? image) async {
    return await resultFromImageRepo.getPredict(image);
  }
}
