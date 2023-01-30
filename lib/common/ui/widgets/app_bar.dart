import 'package:flutter/material.dart';
import 'package:news_app/utils/screen_utils.dart';

import '../../theme/theme_colour.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: ThemeColour.primaryColour),
      ),
      centerTitle: true,
      backgroundColor: ThemeColour.selectedColour,
    );
  }

  @override
  Size get preferredSize =>
      Size(ScreenUtil.screenWidth, ScreenUtil.statusBarHeight);
}
