import '../repository/news_favourite_repository.dart';

class RemoveFavouriteNewsItemUseCase {
  late final NewsFavouriteRepository newsFavouriteRepository;

  RemoveFavouriteNewsItemUseCase({required this.newsFavouriteRepository});

  Future<void> call(int newsId) async {
    return await newsFavouriteRepository.removeFavouriteItem(newsId);
  }
}
