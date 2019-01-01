import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../modules/protocols/protocol_main_page.dart';

import '../../component/tab_bar_icon_item.dart';

class WindowHome extends StatefulWidget implements MainPageProtocol {
  const WindowHome({
    Key key,
    this.tabBarItem,
  }) : super(key: key);

  final TabBarIconItem tabBarItem;

  @override
  State<StatefulWidget> createState() => _WindowHomeState();

  @override
  Widget naviHeaderView(BuildContext context) {
    // TODO: implement naviHeaderView
    return null;
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
