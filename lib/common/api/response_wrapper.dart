abstract class ResponseWrapper<T> {}

class Success<T> extends ResponseWrapper<T> {
  T? data;

  Success({required this.data});
}

class Failure<T> extends ResponseWrapper<T> {
  Exception error;

  Failure({required this.error});
}
