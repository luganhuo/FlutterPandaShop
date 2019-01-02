import 'package:flutter/material.dart';

import '../../component/tab_bar_icon_item.dart';
import '../../constants/constant_images.dart';
import '../../modules/protocols/protocol_tab_bar_item.dart';
import '../../translations.dart';
import '../../utils/image_in_assets.dart';
import '../../modules/protocols/protocol_main_page.dart';

class BrandsWindow extends StatefulWidget implements MainPageProtocol {
  _BrandsWindowState createState() => _BrandsWindowState();

  @override
  Widget naviHeaderView(BuildContext context) {
    // TODO: implement naviHeaderView
    return Text(Translations.of(context).text("tabbarItemDesignersTitle"));
  }

  @override
  List<Widget> naviLeftButtons(BuildContext context) {
    // TODO: implement naviLeftButtons
    return null;
  }

  @override
  List<Widget> naviRightButtons(BuildContext context) {
    // TODO: implement naviRightButtons
    return null;
  }

  @override
  TabBarItemProtocol tabBarItem(BuildContext context) {
    // TODO: implement tabBarItem
    return TabBarIconItem(
        title: Translations.of(context).text("tabbarItemShopTitle"),
        icon: ImageIcon(ImageInAssets(name: Images.shop_offstate_icon).assetImage()),
        activeIcon: ImageIcon(ImageInAssets(name: Images.shop_onstate_icon).assetImage()));
  }
}

class _BrandsWindowState extends State<BrandsWindow> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Material(child: Container(child: Text("Brands"),),),
    );
  }
}