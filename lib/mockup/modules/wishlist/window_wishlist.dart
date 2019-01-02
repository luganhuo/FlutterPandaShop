import 'package:flutter/material.dart';

import '../../component/tab_bar_icon_item.dart';
import '../../constants/constant_images.dart';
import '../../modules/protocols/protocol_main_page.dart';
import '../../modules/protocols/protocol_tab_bar_item.dart';
import '../../translations.dart';
import '../../utils/image_in_assets.dart';

class WishListWindow extends StatefulWidget implements MainPageProtocol {
  _WishListWindowState createState() => _WishListWindowState();

  @override
  Widget naviHeaderView(BuildContext context) {
    // TODO: implement naviHeaderView
    return Text(Translations.of(context).text("tabbarItemWishlistTitle"));
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
        title: Translations.of(context).text("tabbarItemWishlistTitle"),
        icon: ImageIcon(ImageInAssets(name: Images.wishlist_offstate_icon).assetImage()),
        activeIcon: ImageIcon(ImageInAssets(name: Images.wishlist_onstate_icon).assetImage()));
  }
}

class _WishListWindowState extends State<WishListWindow> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Material(child: Container(child: Text("Wish List"),),),
    );
  }
}