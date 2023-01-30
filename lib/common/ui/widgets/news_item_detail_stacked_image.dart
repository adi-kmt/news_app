import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/common/theme/theme_text.dart';
import 'package:news_app/news_list_feature/domain/model/news_entity.dart';
import 'package:news_app/utils/screen_utils.dart';

class NewsStackedImageWidget extends StatelessWidget {
  final NewsArticleEntity newsArticleEntity;

  const NewsStackedImageWidget({Key? key, required this.newsArticleEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withOpacity(0.5),
              Colors.black.withOpacity(0.9),
            ],
          ),
        ),
        child: CachedNetworkImage(
          imageUrl: newsArticleEntity.image,
          width: ScreenUtil.screenWidth,
          height: ScreenUtil.screenHeight / 2,
        ),
      ),
      Positioned(
          bottom: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              newsArticleEntity.source,
              style: ThemeText.bodyText2?.copyWith(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          )),
      Positioned(
          bottom: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Time: 25:00",
              style: ThemeText.bodyText2?.copyWith(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          )),
    ]);
  }
}
