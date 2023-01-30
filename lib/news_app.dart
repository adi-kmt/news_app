import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/theme/main_theme.dart';
import 'package:news_app/common/ui/widgets/app_bar.dart';
import 'package:news_app/common/ui/widgets/bottom_navigation_bar.dart';
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
          appBar: CustomAppBar(title: StringUtils.appTitle),
          bottomNavigationBar: const CustomBottomNavBar(),
          body: BlocBuilder<BottomNavBarCubit, int>(builder: (context, state) {
            return RoutesUtils.navigationList[state];
          }),
        ),
      ),
    );
  }
}
