import '../../../news_list_feature/domain/model/news_entity.dart';
import '../repository/news_favourite_repository.dart';

class AddFavouriteNewsItemUseCase {
  late final NewsFavouriteRepository newsFavouriteRepository;

  AddFavouriteNewsItemUseCase({required this.newsFavouriteRepository});

  //TODO Why Mock failing without nullable return
  Future<void>? call(NewsArticleEntity newsArticleEntity) async {
    return await newsFavouriteRepository.addFavouriteItem(newsArticleEntity);
  }
}
