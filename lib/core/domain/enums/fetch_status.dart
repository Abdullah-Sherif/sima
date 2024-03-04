enum FetchStatus {
  initial,
  loading,
  success,
  failure,
}

extension FetchStatusX on FetchStatus {
  bool get isInitial => this == FetchStatus.initial;
  bool get isLoading => this == FetchStatus.loading;
  bool get isSuccess => this == FetchStatus.success;
  bool get isFailure => this == FetchStatus.failure;
  bool get isInProgressOrSuccess => isLoading || isSuccess;
}
