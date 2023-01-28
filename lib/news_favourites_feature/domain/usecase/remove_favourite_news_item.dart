import '../../../common/api/response_wrapper.dart';
import '../../../common/domain/base_usecase.dart';
import '../../../common/domain/no_param.dart';
import '../repository/news_favourite_repository.dart';

class RemoveFavouriteNewsItemUseCase implements BaseUseCase<List, NoParams> {
  late final NewsFavouriteRepository newsFavouriteRepository;

  RemoveFavouriteNewsItemUseCase({required this.newsFavouriteRepository});

  @override
  Future<ResponseWrapper> call(NoParams param) {
    return newsFavouriteRepository.removeFavouriteItem();
  }
}
