import 'package:news_app/news_list_feature/domain/model/news_entity.dart';

import '../repository/news_favourite_repository.dart';

class CheckIfFavouriteNewsItemUseCase {
  late final NewsFavouriteRepository newsFavouriteRepository;

  CheckIfFavouriteNewsItemUseCase({required this.newsFavouriteRepository});

  Future<bool> call(NewsArticleEntity newsArticleEntity) async {
    return await newsFavouriteRepository.checkIfFavourite(newsArticleEntity);
  }
}
