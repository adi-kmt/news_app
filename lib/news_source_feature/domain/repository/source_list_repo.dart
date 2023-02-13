import '../../../common/api/response_wrapper.dart';

abstract class SourceListRepository {
  Future<ResponseWrapper<dynamic>> getSourcesList();
}
