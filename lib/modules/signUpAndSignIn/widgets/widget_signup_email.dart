import 'package:flutter/material.dart';

import '../../../component/button/gesture_widget.dart';
import '../../../component/textfield/input_field.dart';
import '../../../constants/constant_images.dart';
import '../../../constants/constant_spacing.dart';
import '../../../utils/image_in_assets.dart';

enum SignUpType {
  mobile,
  email,
}

class WidgetSignUpEmailEntry extends StatefulWidget {
  _WidgetSignUpEmailEntryState createState() => _WidgetSignUpEmailEntryState();
}

class _WidgetSignUpEmailEntryState extends State<WidgetSignUpEmailEntry> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(Spacing.m, Spacing.xs, Spacing.m, Spacing.m),
      child: Wrap(
        children: <Widget>[
          Container(
            height: 30,
            child: Row(
              children: <Widget>[
                GestureHolder.bindGestureEvent(
                  Center(child: Text("使用手机号")),
                  () => print("mobile pressed"),
                ),
                SizedBox(width: 18),
                GestureHolder.bindGestureEvent(
                  Center(child: Text("使用邮箱地址")),
                  () => print("email pressed"),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          InputField(
            suffixView: ImageInAssets(name: Images.validation_tick).image(),
            hintText: "hello",
            shouldChangeText: (newValue) => true,
            onTextDidChanged: (newValue) {},
            onTextEndEditing: (newValue) {},
            stateOfChangedText: (newValue) {},
          )
        ],
      ),
    );
  }
}
