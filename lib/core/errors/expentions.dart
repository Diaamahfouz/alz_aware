import 'package:dio/dio.dart';

import 'error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "فشل الاتصال بالخادم");
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "تم إلغاء الطلب إلى الخادم");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "انتهت مدة الاتصال بالخادم");
        case DioExceptionType.unknown:
          return ApiErrorModel(
              message: "فشل الاتصال بالخادم بسبب مشكلة في الاتصال بالإنترنت");
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(message: "انتهت مدة استلام البيانات من الخادم");
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(message: "انتهت مدة إرسال البيانات إلى الخادم");
        default:
          return ApiErrorModel(message: "حصل خطأ غير متوقع");
      }
    } else {
      return ApiErrorModel(message: "حدث خطأ غير معروف");
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  return ApiErrorModel(
    message: data['message'] ?? "حدث خطأ غير معروف",
    status: data['status'] ?? data['code'],
  );
}
