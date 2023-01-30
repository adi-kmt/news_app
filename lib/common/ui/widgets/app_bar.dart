import 'package:flutter/material.dart';
import 'package:news_app/common/theme/theme_sizes.dart';
import 'package:news_app/utils/screen_utils.dart';
import 'package:news_app/utils/size_utils.dart';

import '../../theme/theme_colour.dart';
import '../../theme/theme_text.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style:
            ThemeText.subtitle1?.copyWith(color: ThemeColour.secondaryColour),
      ),
      centerTitle: true,
      backgroundColor: ThemeColour.selectedColour,
    );
  }

  @override
  Size get preferredSize => Size(ScreenUtil.screenWidth,
      (ScreenUtil.statusBarHeight + ThemeSizes.dimen_14.h));
}
