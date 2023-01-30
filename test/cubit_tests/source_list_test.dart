import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/common/api/response_wrapper.dart';
import 'package:news_app/common/domain/no_param.dart';
import 'package:news_app/news_source_feature/domain/model/news_source_entity.dart';
import 'package:news_app/news_source_feature/domain/usecase/sources_list_usecase.dart';
import 'package:news_app/news_source_feature/ui/bloc/news_source_list_cubit.dart';

class SourceUsecaseMock extends Mock implements SourcesListUsecase {}

void main() {
  late final SourcesListUsecase sourcesListUsecase;
  late final NewsSourceListCubit newsSourceListCubit;

  setUpAll(() {
    sourcesListUsecase = SourceUsecaseMock();
    newsSourceListCubit =
        NewsSourceListCubit(sourcesListUsecase: sourcesListUsecase);
  });

  test("Check initial state of cubit", () {
    expect(newsSourceListCubit.state, NewsSourceListInitial());
  });

  blocTest<NewsSourceListCubit, NewsSourceListState>(
    "Check loading and success test",
    build: () => newsSourceListCubit,
    setUp: () async {
      final ResponseWrapper response = Success(data: [
        NewsSourceEntity(name: "abcd", language: "abc", country: "efg"),
        NewsSourceEntity(name: "abc", language: "acb", country: "egf"),
      ]);
      when(() => sourcesListUsecase.call(NoParams()))
          .thenAnswer((_) async => Future(() => response));
    },
    act: (cubit) => cubit.getSources(),
    expect: () => <NewsSourceListState>[
      NewsSourcesListLoading(),
      NewsSourcesListReady(sourceList: [
        NewsSourceEntity(name: "abcd", language: "abc", country: "efg"),
        NewsSourceEntity(name: "abc", language: "acb", country: "egf")
      ])
    ],
  );

  blocTest<NewsSourceListCubit, NewsSourceListState>(
    "Check loading and failure test",
    build: () => newsSourceListCubit,
    setUp: () async {
      final ResponseWrapper response = Failure(error: Exception("Failed"));
      when(() => sourcesListUsecase.call(NoParams()))
          .thenAnswer((_) async => Future(() => response));
    },
    act: (cubit) => cubit.getSources(),
    expect: () => <NewsSourceListState>[
      NewsSourcesListLoading(),
      NewsSourcesListFailed(errorMessage: Exception("Failed"))
    ],
  );
}
