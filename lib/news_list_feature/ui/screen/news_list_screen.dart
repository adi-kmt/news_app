import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/common/di/get_it_module.dart' as get_it;
import 'package:news_app/common/ui/widgets/news_item_widget.dart';
import 'package:news_app/news_list_feature/domain/model/news_entity.dart';

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
