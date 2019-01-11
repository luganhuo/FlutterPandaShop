import 'package:flutter/material.dart';
import 'package:pandashop/constants/constant_fonts.dart';

import '../constants/constant_colors.dart';
import '../modules/protocols/protocol_tab_bar_item.dart';

class TabBarIconItem implements TabBarItemProtocol {
  final BottomNavigationBarItem item;

  TabBarIconItem({String title, Widget icon, Widget activeIcon})
      : item = BottomNavigationBarItem(
          title: Text(title, style: PandaTextStyle.sfui.copyWith(fontSize: 15, fontWeight: FontWeight.w300),),
          icon: icon,
          activeIcon: activeIcon,
          backgroundColor: Colours.white,
        );
}
