import 'package:flutter/material.dart';

import '../constants/constant_colors.dart';

class TabBarIconItem {
  final BottomNavigationBarItem item;

  TabBarIconItem({String title, Widget icon, Widget activeIcon})
      : item = BottomNavigationBarItem(
            title: Text(title),
            icon: icon,
            activeIcon: activeIcon,
            backgroundColor: Colours.white);
}
