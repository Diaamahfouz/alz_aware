enum State { initial, loading, loadingMore, success, failure, offline }

class StateStatus<T> {
  final State state;
  final T? data;
  final int? index;
  final String? error;

  const StateStatus._({required this.state, this.data, this.index, this.error});

  const StateStatus.initial() : this._(state: State.initial);
  const StateStatus.loading({int? index})
    : this._(state: State.loading, index: index);
  const StateStatus.loadingMore() : this._(state: State.loadingMore);
  const StateStatus.success(T? data) : this._(state: State.success, data: data);
  const StateStatus.failure(String error)
    : this._(state: State.failure, error: error);
  const StateStatus.offline() : this._(state: State.offline);

  bool get isInitial => state == State.initial;
  bool get isLoading => state == State.loading;
  bool get isLoadingMore => state == State.loadingMore;
  bool get isSuccess => state == State.success;
  bool get isFailure => state == State.failure;
  bool get isOffline => state == State.offline;

  // Method to check if state should trigger UI rebuild
  bool get isTheCurrentState =>
      isLoading || isSuccess || isFailure || isOffline || isLoadingMore;

  @override
  String toString() => state == State.initial
      ? "Initial"
      : state == State.loading
      ? "Loading"
      : state == State.loadingMore
      ? "LoadingMore"
      : state == State.success
      ? "Success(data: $data)"
      : state == State.failure
      ? "Failure(error: $error)"
      : "Offline";
}
