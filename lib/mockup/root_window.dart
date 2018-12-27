import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pandashop/mockup/constants/constant_fonts.dart';

import '../mockup/utils/image_in_assets.dart';
import 'component/tab_bar_icon_item.dart';
import 'constants/constant_images.dart';
import 'modules/brands/window_brands.dart';
import 'modules/category/window_category.dart';
import 'modules/home/window_home.dart';
import 'modules/me/window_me.dart';
import 'modules/wishlist/window_wishlist.dart';
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
          icon: ImageIcon(ImageInAssets(name: Images.home_offstate_icon).assetImage()),
          activeIcon: ImageIcon(ImageInAssets(name: Images.home_onstate_icon).assetImage())),
      TabBarIconItem(
          title: Translations.of(context).text("tabbarItemShopTitle"),
          icon: ImageIcon(ImageInAssets(name: Images.shop_offstate_icon).assetImage()),
          activeIcon: ImageIcon(ImageInAssets(name: Images.shop_onstate_icon).assetImage())),
      TabBarIconItem(
          title: Translations.of(context).text("tabbarItemDesignersTitle"),
          icon: ImageIcon(ImageInAssets(name: Images.designers_offstate_icon).assetImage()),
          activeIcon: ImageIcon(ImageInAssets(name: Images.designers_onstate_icon).assetImage())),
      TabBarIconItem(
          title: Translations.of(context).text("tabbarItemWishlistTitle"),
          icon: ImageIcon(ImageInAssets(name: Images.wishlist_offstate_icon).assetImage()),
          activeIcon: ImageIcon(ImageInAssets(name: Images.wishlist_onstate_icon).assetImage())),
      TabBarIconItem(
          title: Translations.of(context).text("tabbarItemMeTitle"),
          icon: ImageIcon(ImageInAssets(name: Images.me_offstate_icon).assetImage()),
          activeIcon: ImageIcon(ImageInAssets(name: Images.me_onstate_icon).assetImage()))
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
          style: PandaTextStyle.polaris.copyWith(fontWeight: FontWeight.w700, fontSize: 15),
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
