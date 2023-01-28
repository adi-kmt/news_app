import 'package:news_app/common/api/response_wrapper.dart';
import 'package:news_app/common/domain/base_usecase.dart';
import 'package:news_app/common/domain/no_param.dart';

import '../repository/news_favourite_repository.dart';

class GetFavouriteNewsListUseCase implements BaseUseCase<List, NoParams> {
  late final NewsFavouriteRepository newsFavouriteRepository;

  GetFavouriteNewsListUseCase({required this.newsFavouriteRepository});

  @override
  Future<ResponseWrapper> call(NoParams param) {
    return newsFavouriteRepository.getFavouriteList();
  }
}
