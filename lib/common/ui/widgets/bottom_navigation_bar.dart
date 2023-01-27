import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../theme/theme_colour.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: ThemeColour.selectedColour,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
        child: GNav(
          selectedIndex: 0,
          activeColor: ThemeColour.secondaryColour,
          gap: 8,
          backgroundColor: ThemeColour.selectedColour,
          color: ThemeColour.primaryColour,
          tabs: [
            GButton(icon: Icons.newspaper, text: "Main Headlines"),
            GButton(icon: Icons.source, text: "Sources"),
            GButton(icon: Icons.favorite, text: "Favourite")
          ],
        ),
      ),
    );
  }
}
