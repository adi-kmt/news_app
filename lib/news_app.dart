import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/common/theme/main_theme.dart';
import 'package:news_app/common/theme/theme_colour.dart';
import 'package:news_app/common/ui/widgets/app_bar.dart';
import 'package:news_app/common/ui/widgets/bottom_navigation_bar.dart';
import 'package:news_app/news_favourites_feature/ui/screen/news_favourite_screen.dart';
import 'package:news_app/news_list_feature/ui/screen/news_list_screen.dart';
import 'package:news_app/news_source_feature/ui/screen/source_list_screen.dart';
import 'package:news_app/utils/routes_utils.dart';
import 'package:news_app/utils/screen_utils.dart';
import 'package:news_app/utils/string_utils.dart';

import 'common/bloc/bottom_nav_bar_cubit.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: StringUtils.appTitle,
        theme: returnTheme(),
        home: Scaffold(
          appBar: CustomAppBar(),
          bottomNavigationBar: const CustomBottomNavBar(),
          body: BlocBuilder<BottomNavBarCubit, int>(builder: (context, state) {
            return RoutesUtils.navigationList[state];
          }),
        ),
      ),
    );
  }
}
