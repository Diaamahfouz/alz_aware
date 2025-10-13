import 'dart:math';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioException(
      {required DioException dioException}) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure(
          errorMessage: 'انتهت مهلة الاتصال بالخادم',
        );
      case DioExceptionType.sendTimeout:
        return const ServerFailure(
          errorMessage: 'انتهت مهلة الإرسال إلى الخادم',
        );
      case DioExceptionType.receiveTimeout:
        return const ServerFailure(
          errorMessage: 'انتهت مهلة الاستلام من الخادم',
        );
      case DioExceptionType.badCertificate:
        return const ServerFailure(
          errorMessage: 'شهادة غير صالحة مع الخادم',
        );
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          statusCode: dioException.response!.statusCode,
          response: dioException.response!.data,
        );

      case DioExceptionType.cancel:
        return const ServerFailure(
          errorMessage: 'تم إلغاء الطلب إلى الخادم',
        );
      case DioExceptionType.connectionError:
        return const ServerFailure(
          errorMessage:
              'لا يوجد اتصال بالإنترنت، يرجى المحاولة مرة أخرى!',
        );
      case DioExceptionType.unknown:
        return const ServerFailure(
          errorMessage: "$e",
        );
    }
  }

  factory ServerFailure.fromResponse(
      {int? statusCode, dynamic response}) {
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 422 ||
        statusCode == 409 ||
        statusCode == 424 ||
        statusCode == 404) {
      return ServerFailure(
        errorMessage: response['message'] ??
            'خطأ غير متوقع، يرجى المحاولة لاحقًا!',
      );
    } else if (statusCode == 500) {
      return const ServerFailure(
        errorMessage: 'خطأ في الخادم، يرجى المحاولة لاحقًا!',
      );
    } else if (statusCode == 403) {
      //    Helper.expiredToken();
      return const ServerFailure(
          errorMessage:
              'انتهت صلاحية جلستك، يرجى تسجيل الدخول مرة أخرى!');
    } else {
      return ServerFailure(
        errorMessage: "${response['message'] ?? 'خطأ غير معروف'}",
      );
    }
  }

  @override
  List<Object?> get props => [];
}

class OfflineFailures extends Failure {
  const OfflineFailures({required super.errorMessage});

  @override
  List<Object?> get props => [];
}

class CacheFailures extends Failure {
  const CacheFailures({required super.errorMessage});

  @override
  List<Object?> get props => [];
}
