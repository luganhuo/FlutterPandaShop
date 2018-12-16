import 'package:flutter/material.dart';
import 'package:pandashop/mockup/constants/constant_colors.dart';

class NavigationIconView {
  final BottomNavigationBarItem item;

  NavigationIconView({String title, Widget icon, Widget activeIcon})
      : item = BottomNavigationBarItem(
            title: Text(title),
            icon: icon,
            activeIcon: activeIcon,
            backgroundColor: Colours.COLOR_WHITE
        );
}