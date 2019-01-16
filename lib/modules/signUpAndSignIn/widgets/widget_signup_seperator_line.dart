import 'package:flutter/material.dart';
import 'package:flutter_panda_foundation/flutter_panda_foundation.dart';
//import '../../../constants/constant_colors.dart';
//import '../../../constants/constant_spacing.dart';

class WidgetSignUpSeparatorLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: Spacing.m, right: Spacing.m),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colours.darkGrey,
              height: 0.5,
            ),
          ),
          SizedBox.fromSize(size: Size(15, 0)),
          Text("或"),
          SizedBox.fromSize(size: Size(15, 0)),
          Expanded(
            child: Container(
              color: Colours.darkGrey,
              height: 0.5,
            ),
          )
        ],
      ),
    );
  }
}
