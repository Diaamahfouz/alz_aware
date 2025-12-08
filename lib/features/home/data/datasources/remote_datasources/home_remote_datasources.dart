import 'package:alz_aware/core/api/errors/failure.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/api/end_points.dart';

abstract interface class HomeRemoteDataSource {
  Future<String> getPredict();
}

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiConsumer _dio;

  HomeRemoteDataSourceImpl(this._dio);

  @override
  Future<String> getPredict() async {
    try {
      final response = await _dio.get(path: EndPoints.predict);
      return response.data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioException(dioException: e);
    }
  }
}
