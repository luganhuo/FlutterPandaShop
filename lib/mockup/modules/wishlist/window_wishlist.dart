import 'package:flutter/material.dart';


import '../../component/tab_bar_icon_item.dart';
import '../../constants/constant_colors.dart';
import '../../constants/constant_images.dart';
import '../../constants/constant_spacing.dart';
import '../../modules/protocols/protocol_main_page.dart';
import '../../modules/protocols/protocol_tab_bar_item.dart';
import '../../translations.dart';
import '../../utils/image_in_assets.dart';

class WishListWindow extends StatefulWidget implements MainPageProtocol {
  _WishListWindowState createState() => _WishListWindowState();

  @override
  Widget navigatorHeaderView(BuildContext context) {
    return Text(Translations.of(context).text("tabbarItemWishlistTitle"));
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
        title: Translations.of(context).text("tabbarItemWishlistTitle"),
        icon: ImageIcon(
            ImageInAssets(name: Images.wishlist_offstate_icon).assetImage()),
        activeIcon: ImageIcon(
            ImageInAssets(name: Images.wishlist_onstate_icon).assetImage()));
  }
}

class _WishListWindowState extends State<WishListWindow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: Container(
          padding: EdgeInsets.all(Spacing.s),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Wish List"),
              SizedBox(height: 8),
              TextField(
                onChanged: (newValue) => print(newValue),
                decoration: InputDecoration(
                    labelText: "hello world",
                    prefixIcon: Icon(Icons.perm_identity),
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colours.grey),
                        borderRadius: BorderRadius.circular(1.0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colours.lightGrey),
                        borderRadius: BorderRadius.circular(1.0))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
