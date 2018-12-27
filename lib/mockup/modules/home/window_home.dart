import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../component/tab_bar_icon_item.dart';

class WindowHome extends StatefulWidget {
  const WindowHome({
    Key key,
    this.tabbarItem,
  }) : super(key: key);

  final TabBarIconItem tabbarItem;

  @override
  State<StatefulWidget> createState() => _WindowHomeState();
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
