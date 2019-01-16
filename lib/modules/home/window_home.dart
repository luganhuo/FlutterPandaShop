import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_panda_appkit/flutter_panda_appkit.dart';
import 'package:flutter_panda_foundation/flutter_panda_foundation.dart';

import '../../core/multi_lang/translations.dart';
//import '../../component/button/button.dart';
//import '../../component/tab_bar_icon_item.dart';
//import '../../constants/constant_images.dart';

//import '../../modules/protocols/protocol_main_page.dart';
//import '../../modules/protocols/protocol_tab_bar_item.dart';
//import '../../utils/image_in_assets.dart';

class WindowHome extends StatefulWidget implements MainPageProtocol {
  const WindowHome({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WindowHomeState();

  @override
  Widget navigatorHeaderView(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ImageInAssets(name: Images.nav_logo_icon_dark).image(),
        ],
      ),
    );
  }

  @override
  List<Widget> navigatorLeftButtons(BuildContext context) {
    return null;
  }

  @override
  List<Widget> navigatorRightButtons(BuildContext context) {
    return null;
  }

  @override
  TabBarItemProtocol tabBarItem(BuildContext context) {
    return TabBarIconItem(
        title: Translations.of(context).text("tabbarItemHomeTitle"),
        icon: ImageIcon(ImageInAssets(name: Images.home_offstate_icon).assetImage()),
        activeIcon: ImageIcon(ImageInAssets(name: Images.home_onstate_icon).assetImage()));
  }
}

class _WindowHomeState extends State<WindowHome> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('HomeWidget'),
              SizedBox(height: 12),
              Button(
                title: "Primary",
                icon: ImageInAssets(name: Images.flag_china).image(),
                accessoryIcon: ImageInAssets(name: Images.indicator_arrow_r).image(),
                onPressed: () => print("Primary button pressed."),
              ),
              SizedBox(height: 12),
              Button(
                title: "Secondary",
                icon: ImageInAssets(name: Images.flag_china).image(),
                accessoryIcon: ImageInAssets(name: Images.indicator_arrow_r).image(),
                onPressed: () => print("Secondary button pressed."),
                style: ButtonStyle(type: ButtonType.secondary, layout: ButtonLayout.block),
              ),
              SizedBox(height: 12),
              Button(
                title: "Tertiary",
                icon: ImageInAssets(name: Images.flag_china).image(),
                accessoryIcon: ImageInAssets(name: Images.indicator_arrow_r).image(),
                onPressed: () => print("Tertiary button pressed."),
                style: ButtonStyle(type: ButtonType.tertiary),
              ),
              SizedBox(height: 12),
              Button(
                title: "Flat",
                icon: ImageInAssets(name: Images.flag_china).image(),
                accessoryIcon: ImageInAssets(name: Images.indicator_arrow_r).image(),
                onPressed: () => print("Flat button pressed."),
                style: ButtonStyle(type: ButtonType.flat, layout: ButtonLayout.block),
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
