import '../repository/news_favourite_repository.dart';

class CheckIfFavouriteNewsItemUseCase {
  late final NewsFavouriteRepository newsFavouriteRepository;

  CheckIfFavouriteNewsItemUseCase({required this.newsFavouriteRepository});

  Future<bool> call(int newsId) async {
    return await newsFavouriteRepository.checkIfFavourite(newsId);
  }
}
