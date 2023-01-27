import 'package:flutter/material.dart';
import 'package:news_app/common/theme/main_theme.dart';
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
      builder: (context, _) {
        return const NewsListScreen();
      },
    );
  }
}
