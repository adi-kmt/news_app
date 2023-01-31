import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/di/get_it_module.dart' as get_it;
import 'package:news_app/common/ui/widgets/source_item_widget.dart';
import 'package:news_app/utils/string_utils.dart';

import '../bloc/news_source_list_cubit.dart';

class SourceListScreen extends StatelessWidget {
  const SourceListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get_it.getItInstance<NewsSourceListCubit>(),
      child: BlocBuilder<NewsSourceListCubit, NewsSourceListState>(
          builder: (context, state) {
        if (state is NewsSourcesListLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewsSourcesListReady) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  SourceItemWidget(newsSourceEntity: state.sourceList[index]),
              itemCount: state.sourceList.length,
              scrollDirection: Axis.vertical,
            ),
          );
        } else {
          final errorMessage = state is NewsSourcesListFailed
              ? state.errorMessage.toString()
              : StringUtils.noItemsFound;
          return Center(child: Text(errorMessage));
        }
      }),
    );
  }
}
