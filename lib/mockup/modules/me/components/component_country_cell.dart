import 'package:flutter/material.dart';
import 'package:pandashop/mockup/utils/image_in_assets.dart';

import '../../../constants/constant_colors.dart';

class WidgetCountryLocation extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback onPressed;

  const WidgetCountryLocation({
    Key key, 
    this.icon, 
    @required this.title, 
    @required this.onPressed}
    ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ImageInAssets(name: "assets/images/flag_china.png").image(),
                SizedBox(
                  width: 19,
                ),
                Expanded(
                  child: Container(
                    child: Text("hello world"),
                  ),
                ),
                Icon(
                  Icons.details,
                  size: 24,
                ),
              ],
            ),
          ),
          Container(
            height: 0.5,
            color: Colours.white246,
          )
        ],
      ),
    );
  }
}
