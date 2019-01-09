import 'package:flutter/material.dart';

import '../../component/tab_bar_icon_item.dart';
import '../../constants/constant_images.dart';
import '../../core/multi_lang/translations.dart';
import '../../modules/protocols/protocol_main_page.dart';
import '../../modules/protocols/protocol_tab_bar_item.dart';
import '../../utils/image_in_assets.dart';

class CategoryWindow extends StatefulWidget implements MainPageProtocol {
  _CategoryWindowState createState() => _CategoryWindowState();

  @override
  Widget navigatorHeaderView(BuildContext context) {
    return Text(Translations.of(context).text("tabbarItemShopTitle"));
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
        title: Translations.of(context).text("tabbarItemDesignersTitle"),
        icon: ImageIcon(ImageInAssets(name: Images.designers_offstate_icon).assetImage()),
        activeIcon: ImageIcon(ImageInAssets(name: Images.designers_onstate_icon).assetImage()));
  }
}

class _CategoryWindowState extends State<CategoryWindow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: Container(
          child: Text("Category"),
        ),
      ),
    );
  }
}
