import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import 'errors/failure.dart';

Future<Either<Failure, T>> safeApiCall<T>(Future<T> Function() call) async {
  try {
    final result = await call();
    return Right(result);
  } on DioException catch (e) {
    if (e.type == DioExceptionType.connectionError) {
      return left(
        OfflineFailures(errorMessage: "failures.offline_failure".tr()),
      );
    }
    return left(ServerFailure.fromDioException(dioException: e));
  } catch (e) {
    log("Unexpected error: $e");
    return left(
      const ServerFailure(
        errorMessage: "An unexpected error occurred. Please try again later.",
      ),
    );
  }
}
