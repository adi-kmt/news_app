import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:news_app/common/theme/theme_sizes.dart';
import 'package:news_app/news_item_detail_feature/ui/screen/news_item_detail.dart';
import 'package:news_app/news_list_feature/domain/model/news_entity.dart';
import 'package:news_app/news_list_feature/ui/bloc/news_list_cubit.dart';
import 'package:news_app/utils/size_utils.dart';
import 'package:news_app/utils/string_utils.dart';

class NewsItemWidget extends StatelessWidget {
  final NewsArticleEntity newsArticleEntity;

  const NewsItemWidget({Key? key, required this.newsArticleEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsItemDetailScreen(
                    newsArticleEntity: newsArticleEntity)));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(40.0),
                  bottomRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(40.0))),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CachedNetworkImage(
                  imageUrl: newsArticleEntity.image,
                  width: ThemeSizes.dimen_20.w,
                  height: ThemeSizes.dimen_20.h,
                  placeholder: (context, _) => SizedBox(
                      width: ThemeSizes.dimen_20.w,
                      height: ThemeSizes.dimen_20.h,
                      child: Image.asset(StringUtils.defaultImageLocation)),
                  errorWidget: (context, _, dynamic item) => SizedBox(
                      width: ThemeSizes.dimen_20.w,
                      height: ThemeSizes.dimen_20.h,
                      child: Image.asset(StringUtils.defaultImageLocation)),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      newsArticleEntity.title,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      newsArticleEntity.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
              LikeButton(
                onTap: (bool isLiked) async {
                  isLiked == true
                      ? context
                          .read<NewsListCubit>()
                          .removeNewsFromFavourite(newsArticleEntity)
                      : context
                          .read<NewsListCubit>()
                          .addNewsToFavourite(newsArticleEntity);
                  return !isLiked;
                },
                isLiked: newsArticleEntity.isFavourite,
                animationDuration: const Duration(milliseconds: 2000),
              )
            ],
          ),
        ),
      ),
    );
  }
}
