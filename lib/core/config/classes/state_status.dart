import 'package:equatable/equatable.dart';

enum StateStatusEnum { initial, loading, loadingMore, success, error }

class StateStatus<T> extends Equatable {
  final StateStatusEnum state;
  final T? data;
  final String? exception;

  const StateStatus({required this.state, this.data, this.exception});
  @override
  List<Object?> get props => [state, data, exception];
}
