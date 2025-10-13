import 'package:alz_aware/core/api/app_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_consumer.dart';
import 'end_points.dart';

@Singleton(as: ApiConsumer)
class DioConsumer implements ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.interceptors.add(AppInterceptors(dio: dio));
    dio.interceptors.addAll([
      if (kDebugMode)
        PrettyDioLogger(
          request: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
          compact: true,
        ),
    ]);
  }

  @override
  Future get({
    required String path,
    Options? options,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get(
      path,
      queryParameters: queryParameters,
      data: body,
      options: options,
    );
    return response.data;
  }

  @override
  Future post({
    required String path,
    Object? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.post(
      path,
      queryParameters: queryParameters,
      data: body,
    );

    return response.data;
  }

  @override
  Future put({
    required String path,
    Object? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.put(
      path,
      data: body,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  Future patch({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.patch(
      path,
      data: body,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  Future delete({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.delete(
      path,
      queryParameters: queryParameters,
      data: body,
    );
    return response.data;
  }

  @override
  Future uploadImage({required String imagePath}) async {
    final response = await dio.post(
      EndPoints.uploadOneImage,
      data: FormData.fromMap({
        "image": await MultipartFile.fromFile(
          imagePath,
          filename: imagePath.split('/').last,
          contentType: DioMediaType.parse('image/jpeg'),
        ),
      }),
    );
    return response.data["image"];
  }
}
