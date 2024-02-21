class APIResponse<T> {
  final T data;
  final bool error;
  final String errorMessage;
  APIResponse(
      {required this.data, required this.error, required this.errorMessage});
}
