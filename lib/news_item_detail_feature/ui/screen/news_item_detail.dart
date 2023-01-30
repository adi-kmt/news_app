import 'package:flutter/material.dart';
import 'package:news_app/common/ui/widgets/app_bar.dart';
import 'package:news_app/news_list_feature/domain/model/news_entity.dart';

import '../../../common/ui/widgets/news_item_detail_body.dart';
import '../../../common/ui/widgets/news_item_detail_stacked_image.dart';

class NewsItemDetailScreen extends StatelessWidget {
  final NewsArticleEntity newsArticleEntity;

  const NewsItemDetailScreen({Key? key, required this.newsArticleEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: newsArticleEntity.title),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            NewsStackedImageWidget(newsArticleEntity: newsArticleEntity),
            NewsItemDetailBodyWidget(newsArticleEntity: newsArticleEntity)
          ],
        ));
  }
}
