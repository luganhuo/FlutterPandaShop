import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/constant_images.dart';
import '../../modules/protocols/protocol_tab_bar_item.dart';
import '../../translations.dart';
import '../../utils/image_in_assets.dart';
import '../../modules/protocols/protocol_main_page.dart';
import '../../component/tab_bar_icon_item.dart';

class WindowHome extends StatefulWidget implements MainPageProtocol {
  const WindowHome({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WindowHomeState();

  @override
  Widget naviHeaderView(BuildContext context) {
    // TODO: implement naviHeaderView
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ImageInAssets(name: Images.nav_logo_icon_dark).image(),
        ],
      ),
    );
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
              FlatButton(
                child: Text('Press FlatButton'),
                onPressed: () {
                  print('Flat button pressed');
                },
              ),
              RaisedButton(
                child: Text('Press RaisedButton'),
                onPressed: () {
                  print('RaisedButton pressed.');
                },
              ),
              CupertinoButton(
                child: Text('Cupertino Button'),
                onPressed: () {
                  print("Press CupertinoButton");
                },
              ),
              InkWell(
                child: Text('This is InkWell'),
                enableFeedback: false,
                radius: 0,
                onTap: () {
                  print('InkWell pressed');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
