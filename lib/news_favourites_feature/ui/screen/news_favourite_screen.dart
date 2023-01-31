import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/di/get_it_module.dart' as get_it;
import 'package:news_app/common/ui/widgets/news_favourite_item_widget.dart';

import '../../../utils/string_utils.dart';
import '../bloc/news_favourite_cubit.dart';

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
          } else if (state is NewsFavouriteReady) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemBuilder: (context, index) => NewsFavouriteItemWidget(
                    newsArticleEntity: state.newsArticleEntityList[index]),
                itemCount: state.newsArticleEntityList.length,
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
