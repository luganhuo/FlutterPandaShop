import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pandashop/mockup/component/navigation_icon_view.dart';
import 'package:pandashop/mockup/constants/constant_colors.dart';
import 'package:pandashop/mockup/modules/widget_home.dart';
import 'package:pandashop/mockup/translations.dart';
import 'package:pandashop/mockup/utils/image_in_assets.dart';

class RootWindow extends StatefulWidget {
  @override
  _RootWindowState createState() => _RootWindowState();
}

class _RootWindowState extends State<RootWindow> {
  static const nativePlatform = const MethodChannel("com.farfetch.china.pandashop");

  PageController _pageController;
  List<NavigationIconView> _navigationViews;
  List<Widget> _pages;
  int _currentSelectedTab = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentSelectedTab);
    _pages = [
      HomeWidget(),
      Container(color: Colors.green,),
      Container(color: Colors.blue,),
      Container(color: Colors.purple,),
      Container(color: Colors.yellow,),
    ];
  }

  List<NavigationIconView> _getNavigationBarItems(BuildContext context) {
    print("_getNavigationBarItems");
    _navigationViews = <NavigationIconView>[
      NavigationIconView(
          title: Translations.of(context).text("首页"),
          icon: ImageIcon(ImageInAssets(name: "assets/images/TabBarItem/Default/home_offstate_icon.png").assetImage()),
          activeIcon: ImageIcon(ImageInAssets(name: "assets/images/TabBarItem/Default/home_onstate_icon.png").assetImage())),
      NavigationIconView(
          title: Translations.of(context).text("商品类别"),
          icon: ImageIcon(ImageInAssets(name: "assets/images/TabBarItem/Default/shop_offstate_icon.png").assetImage()),
          activeIcon: ImageIcon(ImageInAssets(name: "assets/images/TabBarItem/Default/shop_onstate_icon.png").assetImage())),
      NavigationIconView(
          title: Translations.of(context).text("品牌"),
          icon: ImageIcon(ImageInAssets(name: "assets/images/TabBarItem/Default/designers_offstate_icon.png").assetImage()),
          activeIcon: ImageIcon(ImageInAssets(name: "assets/images/TabBarItem/Default/designers_onstate_icon.png").assetImage())),
      NavigationIconView(
          title: Translations.of(context).text("愿望单"),
          icon: ImageIcon(ImageInAssets(name: "assets/images/TabBarItem/Default/icon_wishlist_off.png").assetImage()),
          activeIcon: ImageIcon(ImageInAssets(name: "assets/images/TabBarItem/Default/icon_wishlist.png").assetImage())),
      NavigationIconView(
          title: Translations.of(context).text("我的帐户"),
          icon: ImageIcon(ImageInAssets(name: "assets/images/TabBarItem/Default/me_offstate_icon.png").assetImage()),
          activeIcon: ImageIcon(ImageInAssets(name: "assets/images/TabBarItem/Default/me_onstate_icon.png").assetImage())),
    ];
    return _navigationViews;
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar navigationBar = BottomNavigationBar(
      items: _getNavigationBarItems(context).map((NavigationIconView naviIconView) => naviIconView.item).toList(),
      currentIndex: _currentSelectedTab,
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.black,
      onTap: (int index) {
        print('\n${_navigationViews[index].item.title}');
        setState(() {
          _currentSelectedTab = index;
          _pageController.animateToPage(_currentSelectedTab, duration: Duration(milliseconds: 1), curve: Curves.linear);
        });
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Farfetch',style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search,color: Colors.black,), 
            onPressed: (){ print('search'); },
          )
        ],
      ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (int index) {
          setState(() {
            _currentSelectedTab = index;
          });
        },
      ),
      bottomNavigationBar: navigationBar,
    );
  }
}


