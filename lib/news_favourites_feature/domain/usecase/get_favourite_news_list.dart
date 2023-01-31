import 'package:news_app/news_list_feature/domain/model/news_entity.dart';

import '../repository/news_favourite_repository.dart';

class GetFavouriteNewsListUseCase {
  late final NewsFavouriteRepository newsFavouriteRepository;

  GetFavouriteNewsListUseCase({required this.newsFavouriteRepository});

  Future<List<NewsArticleEntity>> call() async {
    return await newsFavouriteRepository.getFavouriteList();
  }
}
