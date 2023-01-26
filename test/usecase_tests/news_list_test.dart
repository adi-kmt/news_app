import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/common/api/response_wrapper.dart';
import 'package:news_app/common/domain/no_param.dart';
import 'package:news_app/news_list_feature/data/repository/news_list_repository_impl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/news_list_feature/data/sources/remote/response/article_response_entity.dart';
import 'package:news_app/news_list_feature/domain/repository/news_list_repo.dart';
import 'package:news_app/news_list_feature/domain/usecase/news_list_usecase.dart';

class NewsRepoMock extends Mock implements NewsListRepositoryImpl {}

void main() {
  late final NewsListRepository newsListRepository;
  late final NewsListUseCase newsListUseCase;
  final NoParams noParams = NoParams();

  setUpAll(() {
    newsListRepository = NewsRepoMock();
    newsListUseCase = NewsListUseCase(newsListRepository: newsListRepository);
  });

  test("Check if Success response is received", () async {
    final ResponseWrapper response = Success(data: []);

    when(() => newsListRepository.getNewsList())
        .thenAnswer((_) async => response);

    final result = await newsListUseCase.call(noParams);
    if (result != null) {
      final isInstanceOf = result is Success;
      expect(isInstanceOf, true);
    } else {
      printOnFailure("Null result recieved");
    }
  });

  test("Check if all data is received", () async {
    final ResponseWrapper response = Success(data: [
      ArticleResponseArticles(),
      ArticleResponseArticles(),
      ArticleResponseArticles()
    ]);

    when(() => newsListRepository.getNewsList())
        .thenAnswer((_) async => response);

    final result = await newsListUseCase.call(noParams);
    if (result != null) {
      if (result is Success) {
        final data = result.data as List<ArticleResponseArticles>;
        expect(data.length, 3);
      } else {
        print("Test failed");
      }
    } else {
      printOnFailure("Null result recieved");
    }
  });

  test("Check if Failure response is received", () async {
    final ResponseWrapper response =
        Failure(error: Exception("Random Exception"));

    when(() => newsListRepository.getNewsList())
        .thenAnswer((_) async => response);

    final result = await newsListUseCase.call(noParams);
    if (result != null) {
      final isInstanceOf = result is Failure;
      expect(isInstanceOf, true);
    } else {
      printOnFailure("Null result recieved");
    }
  });
}
