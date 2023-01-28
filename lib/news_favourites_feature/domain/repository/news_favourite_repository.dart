import 'package:news_app/common/api/response_wrapper.dart';

abstract class NewsFavouriteRepository {
  Future<ResponseWrapper> getFavouriteList();

  Future<ResponseWrapper> addFavouriteItem();

  Future<ResponseWrapper> removeFavouriteItem();
}
