import '../api/response_wrapper.dart';

abstract class BaseUseCase<Type, Params> {
  Future<ResponseWrapper> call(Params param);
}
