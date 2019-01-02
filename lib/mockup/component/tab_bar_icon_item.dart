import 'package:flutter/material.dart';
import '../modules/protocols/protocol_tab_bar_item.dart';

import '../constants/constant_colors.dart';

class TabBarIconItem implements TabBarItemProtocol {
  final BottomNavigationBarItem item;

  TabBarIconItem({String title, Widget icon, Widget activeIcon})
      : item = BottomNavigationBarItem(
            title: Text(title),
            icon: icon,
            activeIcon: activeIcon,
            backgroundColor: Colours.white);
}
