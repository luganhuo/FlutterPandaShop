import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/constant_colors.dart';
import '../../../constants/constant_fonts.dart';

class CheckBox extends StatelessWidget {
  final String title;
  final bool onOrOff;
  final double height;
  final VoidCallback onPressed;

  const CheckBox({Key key, @required this.title, this.onOrOff = false, this.height = 47, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colours.clear,
      height: this.height,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(this.title, style: PandaTextStyle.polaris.copyWith(fontSize: 15, fontWeight: FontWeight.w300)),
                ),
                CupertinoSwitch(
                  activeColor: Colours.black,
                  value: this.onOrOff,
                  onChanged: (bool value) => print('switch $value'),
                ),
              ],
            ),
            Container(height: 0.5, color: Colours.white246),
          ],
        ),
        onTap: this.onPressed,
      ),
    );
  }
}
