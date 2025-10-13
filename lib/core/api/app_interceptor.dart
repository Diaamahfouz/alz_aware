import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors({required this.dio});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // ToDo
    super.onResponse(response, handler);
  }
}
