import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pandashop/mockup/modules/me/window_me.dart';

import '../mockup/utils/image_in_assets.dart';
import 'component/tab_bar_icon_item.dart';
import 'modules/window_brands.dart';
import 'modules/window_category.dart';
import 'modules/window_home.dart';
import 'modules/window_wishlist.dart';
import 'translations.dart';

class RootWindow extends StatefulWidget {
  @override
  _RootWindowState createState() => _RootWindowState();
}

class _RootWindowState extends State<RootWindow> {
  static const nativePlatform = const MethodChannel("com.farfetch.china.pandashop");

  List<TabBarIconItem> _navigationViews;
  List<Widget> _pages = List<Widget>();
  int _currentSelectedTab = 0;

  @override
  void initState() {
    super.initState();
    _pages..add(WindowHome())..add(CategoryWindow())..add(BrandsWindow())..add(WishListWindow())..add(MeWindow());
  }

  List<TabBarIconItem> _getNavigationBarItems(BuildContext context) {
    _navigationViews = <TabBarIconItem>[
      TabBarIconItem(
          title: Translations.of(context).text("tabbarItemHomeTitle"),
          icon: ImageIcon(ImageInAssets(name: "assets/images/home_offstate_icon.png").assetImage()),
          activeIcon: ImageIcon(ImageInAssets(name: "assets/images/home_onstate_icon.png").assetImage())),
      TabBarIconItem(
          title: Translations.of(context).text("tabbarItemShopTitle"),
          icon: ImageIcon(ImageInAssets(name: "assets/images/shop_offstate_icon.png").assetImage()),
          activeIcon: ImageIcon(ImageInAssets(name: "assets/images/shop_onstate_icon.png").assetImage())),
      TabBarIconItem(
          title: Translations.of(context).text("tabbarItemDesignersTitle"),
          icon: ImageIcon(ImageInAssets(name: "assets/images/designers_offstate_icon.png").assetImage()),
          activeIcon: ImageIcon(ImageInAssets(name: "assets/images/designers_onstate_icon.png").assetImage())),
      TabBarIconItem(
          title: Translations.of(context).text("tabbarItemWishlistTitle"),
          icon: ImageIcon(ImageInAssets(name: "assets/images/wishlist_offstate_icon.png").assetImage()),
          activeIcon: ImageIcon(ImageInAssets(name: "assets/images/wishlist_onstate_icon.png").assetImage())),
      TabBarIconItem(
          title: Translations.of(context).text("tabbarItemMeTitle"),
          icon: ImageIcon(ImageInAssets(name: "assets/images/me_offstate_icon.png").assetImage()),
          activeIcon: ImageIcon(ImageInAssets(name: "assets/images/me_onstate_icon.png").assetImage()))
    ];
    return _navigationViews;
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar navigationBar = BottomNavigationBar(
      items: _getNavigationBarItems(context).map((TabBarIconItem naviIconView) => naviIconView.item).toList(),
      currentIndex: _currentSelectedTab,
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.black,
      onTap: (int index) {
        print('\n${_navigationViews[index].item.title}');
        setState(() {
          _currentSelectedTab = index;
        });
      },
    );

    List<Widget> allOffstagePages = [];
    var idx = 0;
    for (var eachPage in _pages) {
      allOffstagePages.add(
        Offstage(
          offstage: _currentSelectedTab != idx,
          child: TickerMode(
            enabled: _currentSelectedTab == idx,
            child: eachPage,
          ),
        ),
      );
      idx++;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Farfetch',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              print('search');
            },
          )
        ],
      ),
      body: Stack(
        children: allOffstagePages,
      ),
      bottomNavigationBar: navigationBar,
    );
  }
}
