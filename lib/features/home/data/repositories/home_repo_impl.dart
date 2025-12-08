import 'package:alz_aware/core/api/errors/failure.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../datasources/remote_datasources/home_remote_datasources.dart';
@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
 const HomeRepoImpl(this.homeRemoteDataSource);
  @override
  Future<Either<Failure, String>> getPredict() {
    // TODO: implement getPredict
    throw UnimplementedError();
  }
 
}
