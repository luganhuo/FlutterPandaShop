import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pandashop/mockup/modules/protocols/protocol_main_page.dart';

import 'modules/brands/window_brands.dart';
import 'modules/category/window_category.dart';
import 'modules/home/window_home.dart';
import 'modules/me/window_me.dart';
import 'modules/wishlist/window_wishlist.dart';

class RootWindow extends StatefulWidget {
  @override
  _RootWindowState createState() => _RootWindowState();
}

class _RootWindowState extends State<RootWindow> {
  static const nativePlatform = const MethodChannel("com.farfetch.china.pandashop");

  List<MainPageProtocol> _pages = List<MainPageProtocol>();
  int _currentSelectedTab = 0;

  @override
  void initState() {
    super.initState();
    _pages
      ..add(WindowHome())
      ..add(CategoryWindow())
      ..add(BrandsWindow())
      ..add(WishListWindow())
      ..add(MeWindow());
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar navigationBar = BottomNavigationBar(
      items: _pages.map((MainPageProtocol eachPage) => eachPage.tabBarItem(context).item).toList(),
      currentIndex: _currentSelectedTab,
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.black,
      onTap: (int index) {
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
            child: eachPage as Widget,
          ),
        ),
      );
      idx++;
    }

    return Scaffold(
      appBar: AppBar(
        title: _pages[_currentSelectedTab].naviHeaderView(context),
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
