import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/common/theme/main_theme.dart';
import 'package:news_app/common/theme/theme_colour.dart';
import 'package:news_app/common/ui/widgets/app_bar.dart';
import 'package:news_app/common/ui/widgets/bottom_navigation_bar.dart';
import 'package:news_app/news_list_feature/ui/screen/news_list_screen.dart';
import 'package:news_app/utils/screen_utils.dart';
import 'package:news_app/utils/string_utils.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringUtils.appTitle,
      theme: returnTheme(),
      home: Scaffold(
        appBar: CustomAppBar(),
        bottomNavigationBar: const CustomBottomNavBar(),
        body: const NewsListScreen(),
      ),
    );
  }
}
