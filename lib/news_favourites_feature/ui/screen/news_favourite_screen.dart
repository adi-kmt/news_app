import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/di/get_it_module.dart' as get_it;
import 'package:news_app/common/ui/widgets/news_favourite_item_widget.dart';

import '../../../news_list_feature/domain/model/news_entity.dart';
import '../../../news_source_feature/ui/bloc/news_source_list_cubit.dart';
import '../../../utils/string_utils.dart';
import '../bloc/news_favourite_cubit.dart';

final news = [
  NewsArticleEntity(
    content: "content",
    description: "description",
    title: "title",
    source: "source",
    image: "image",
    isFavourite: false,
  ),
  NewsArticleEntity(
    content: "content1",
    description: "description1",
    title: "title1",
    source: "source1",
    image: "image1",
    isFavourite: false,
  ),
  NewsArticleEntity(
    content: "content2",
    description: "description2",
    title: "title2",
    source: "source2",
    image: "image2",
    isFavourite: false,
  ),
];

class NewsFavouriteScreen extends StatelessWidget {
  const NewsFavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get_it.getItInstance<NewsFavouriteCubit>(),
      child: BlocBuilder<NewsFavouriteCubit, NewsFavouriteState>(
        builder: (context, state) {
          if (state is NewsFavouriteLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NewsSourcesListReady) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    NewsFavouriteItemWidget(newsArticleEntity: news[index]),
                itemCount: news.length,
                scrollDirection: Axis.vertical,
              ),
            );
          } else {
            return const Center(child: Text(StringUtils.noItemsFound));
          }
        },
      ),
    );
  }
}
