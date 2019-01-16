import 'package:flutter/material.dart';
import 'package:flutter_panda_appkit/flutter_panda_appkit.dart';
import 'package:flutter_panda_foundation/flutter_panda_foundation.dart';

import '../../core/multi_lang/translations.dart';
//import '../../component/tab_bar_icon_item.dart';
//import '../../constants/constant_images.dart';

//import '../../modules/protocols/protocol_main_page.dart';
//import '../../modules/protocols/protocol_tab_bar_item.dart';
//import '../../utils/image_in_assets.dart';

class BrandsWindow extends StatefulWidget implements MainPageProtocol {
  _BrandsWindowState createState() => _BrandsWindowState();

  @override
  Widget navigatorHeaderView(BuildContext context) {
    return Text(Translations.of(context).text("tabbarItemDesignersTitle"));
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
        title: Translations.of(context).text("tabbarItemShopTitle"),
        icon: ImageIcon(ImageInAssets(name: Images.shop_offstate_icon).assetImage()),
        activeIcon: ImageIcon(ImageInAssets(name: Images.shop_onstate_icon).assetImage()));
  }
}

class _BrandsWindowState extends State<BrandsWindow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: Container(
          child: Text("Brands"),
        ),
      ),
    );
  }
}
