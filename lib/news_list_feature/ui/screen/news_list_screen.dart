import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/di/get_it_module.dart' as get_it;
import 'package:news_app/common/ui/widgets/news_item_widget.dart';

import '../../../utils/string_utils.dart';
import '../bloc/news_list_cubit.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get_it.getItInstance<NewsListCubit>(),
      child: BlocBuilder<NewsListCubit, NewsListState>(
        builder: (context, state) {
          if (state is NewsListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NewsListReady) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemBuilder: (context, index) => NewsItemWidget(
                    newsArticleEntity: state.newsArticleEntityList[index]),
                itemCount: state.newsArticleEntityList.length,
                scrollDirection: Axis.vertical,
              ),
            );
          } else if (state is NewsListFavouriteRemoved ||
              state is NewsListFavouriteAdded) {
            return const SnackBar(content: Text("Favourite items updated"));
          } else {
            final errorMessage = state is NewsListFailure
                ? state.errorMessage.toString()
                : StringUtils.noItemsFound;
            return Center(child: Text(errorMessage));
          }
        },
      ),
    );
  }
}
