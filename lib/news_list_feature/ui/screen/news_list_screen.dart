import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/common/ui/widgets/news_item_widget.dart';
import 'package:news_app/news_list_feature/domain/model/news_entity.dart';

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

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemBuilder: (context, index) =>
            NewsItemWidget(newsArticleEntity: news[index]),
        itemCount: news.length,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
