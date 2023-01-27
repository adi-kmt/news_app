import 'package:mocktail/mocktail.dart';
import 'package:news_app/common/api/response_wrapper.dart';
import 'package:news_app/common/domain/no_param.dart';
import 'package:news_app/news_source_feature/data/repository/sources_list_repo_impl.dart';
import 'package:news_app/news_source_feature/data/sources/remote/response/sources_response_entity.dart';
import 'package:news_app/news_source_feature/domain/model/news_source_entity.dart';
import 'package:news_app/news_source_feature/domain/repository/source_list_repo.dart';
import 'package:news_app/news_source_feature/domain/usecase/sources_list_usecase.dart';
import 'package:test/test.dart';

class SourcesRepoMock extends Mock implements SourcesListRepositoryImpl {}

void main() {
  late final SourceListRepository sourceListRepository;
  late final SourcesListUsecase sourcesListUsecase;
  final NoParams noParams = NoParams();

  setUpAll(() {
    sourceListRepository = SourcesRepoMock();
    sourcesListUsecase =
        SourcesListUsecase(sourceListRepository: sourceListRepository);
  });

  test("Check if Success response is received", () async {
    final ResponseWrapper response = Success(data: []);

    when(() => sourceListRepository.getSourcesList())
        .thenAnswer((_) async => response);

    final result = await sourcesListUsecase.call(noParams);
    if (result != null) {
      final isInstanceOf = result is Success;
      expect(isInstanceOf, true);
    } else {
      printOnFailure("Null result recieved");
    }
  });

  test("Check if all data is received", () async {
    final ResponseWrapper response = Success(data: [
      NewsSourceEntity(name: "", language: "", country: ""),
      NewsSourceEntity(name: "", language: "", country: ""),
      NewsSourceEntity(name: "", language: "", country: ""),
    ]);

    when(() => sourceListRepository.getSourcesList())
        .thenAnswer((_) async => response);

    final result = await sourcesListUsecase.call(noParams);
    if (result != null) {
      if (result is Success) {
        final data = result.data as List<NewsSourceEntity>;
        expect(data.length, 3);
      } else {
        print("Test failed");
      }
    } else {
      printOnFailure("Null result recieved");
    }
  });

  //Failed test demo
  test("Check if correct data is received failed", () async {
    final ResponseWrapper response = Success(data: [
      NewsSourceEntity(name: "abcd", language: "abc", country: "efg")
    ]);

    when(() => sourceListRepository.getSourcesList())
        .thenAnswer((_) async => response);

    final result = await sourcesListUsecase.call(noParams);
    if (result != null) {
      if (result is Success) {
        final data = result.data as List<NewsSourceEntity>;
        expect(data[0].country, "abcd");
        expect(data[0].language, "abc");
        expect(data[0].name, "efg");
      } else {
        print("Test failed");
      }
    } else {
      printOnFailure("Null result recieved");
    }
  });

  test("Check if correct data is received", () async {
    final ResponseWrapper response = Success(data: [
      NewsSourceEntity(name: "abcd", language: "abc", country: "efg")
    ]);

    when(() => sourceListRepository.getSourcesList())
        .thenAnswer((_) async => response);

    final result = await sourcesListUsecase.call(noParams);
    if (result != null) {
      if (result is Success) {
        final data = result.data as List<NewsSourceEntity>;
        expect(data[0].country, "efg");
        expect(data[0].language, "abc");
        expect(data[0].name, "abcd");
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

    when(() => sourceListRepository.getSourcesList())
        .thenAnswer((_) async => response);

    final result = await sourcesListUsecase.call(noParams);
    if (result != null) {
      final isInstanceOf = result is Failure;
      expect(isInstanceOf, true);
    } else {
      printOnFailure("Null result recieved");
    }
  });
}
