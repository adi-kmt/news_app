import 'package:flutter/material.dart';
import 'package:news_app/common/theme/theme_text.dart';
import 'package:news_app/news_list_feature/domain/model/news_entity.dart';
import 'package:news_app/utils/screen_utils.dart';

class NewsItemDetailBodyWidget extends StatelessWidget {
  final NewsArticleEntity newsArticleEntity;

  const NewsItemDetailBodyWidget({Key? key, required this.newsArticleEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight / 3,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            newsArticleEntity.description,
            softWrap: true,
            style: ThemeText.bodyText2,
          ),
        ),
      ),
    );
  }
}
