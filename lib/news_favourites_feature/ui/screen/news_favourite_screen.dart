import 'package:flutter/material.dart';
import 'package:news_app/common/ui/widgets/news_favourite_item_widget.dart';

import '../../../news_list_feature/domain/model/news_entity.dart';

final news = [
  NewsArticleEntity(
      content: "content",
      description: "description",
      title: "title",
      source: "source",
      image: "image"),
  NewsArticleEntity(
      content: "content1",
      description: "description1",
      title: "title1",
      source: "source1",
      image: "image1"),
  NewsArticleEntity(
      content: "content2",
      description: "description2",
      title: "title2",
      source: "source2",
      image: "image2"),
];

class NewsFavouriteScreen extends StatelessWidget {
  const NewsFavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemBuilder: (context, index) =>
            NewsFavouriteItemWidget(newsArticleEntity: news[index]),
        itemCount: news.length,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
