import 'package:equatable/equatable.dart';

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class PaginationParams extends Equatable {
  final int page;
  final int limit;

  const PaginationParams({required this.limit, required this.page});

  @override
  List<Object?> get props => [limit, page];
}

class Params extends Equatable {
  @override
  List<Object?> get props => [];
}
