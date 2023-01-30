import '../repository/news_favourite_repository.dart';

class RemoveFavouriteNewsItemUseCase {
  late final NewsFavouriteRepository newsFavouriteRepository;

  RemoveFavouriteNewsItemUseCase({required this.newsFavouriteRepository});

  Future<void> call(String newsTitle) async {
    return await newsFavouriteRepository.removeFavouriteItem(newsTitle);
  }
}
