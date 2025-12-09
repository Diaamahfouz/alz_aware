import 'dart:io';

import 'package:alz_aware/core/api/errors/failure.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/helper/upload_image_to_api.dart';

abstract interface class ResultFromImageRemoteDataSource {
  Future<String> getPredict(File? image);
}

@Injectable(as: ResultFromImageRemoteDataSource)
class ResultFromImageRemoteDataSourceImpl
    implements ResultFromImageRemoteDataSource {
  final Dio _dio;

  ResultFromImageRemoteDataSourceImpl(this._dio);

  @override
  Future<String> getPredict(File? image) async {
    try {
      final response = await _dio.post(
        EndPoints.predict,
        data: image != null
            ? FormData.fromMap({"image": await uploadImageToAPI(image)})
            : null,
      );
      return response.data['prediction'];
    } on DioException catch (e) {
      throw ServerFailure.fromDioException(dioException: e);
    }
  }
}
