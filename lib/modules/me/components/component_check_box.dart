import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/constant_colors.dart';
import '../../../constants/constant_fonts.dart';

typedef onSwitchValueChanged = void Function(bool);

class CheckBox extends StatefulWidget {
  final String title;
  final TextStyle titleStyle;
  bool onOrOff;
  final onSwitchValueChanged onPressed;

  CheckBox({
    Key key,
    @required this.title,
    this.onOrOff,
    @required this.onPressed,
    this.titleStyle,
  }) : super(key: key);

  @override
  CheckBoxState createState() {
    return new CheckBoxState();
  }
}

class CheckBoxState extends State<CheckBox> {
  void _onValueChangedInternal(bool newValue) {
    print('switch $newValue');
    setState(() {
      this.widget.onOrOff = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle tstyle = this.widget.titleStyle ?? PandaTextStyle.polaris.copyWith(fontSize: 15, fontWeight: FontWeight.w300);

    return Container(
      color: Colours.clear,
      child: GestureDetector(
          behavior: HitTestBehavior.deferToChild,
          onTap: () => _onValueChangedInternal(!this.widget.onOrOff),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      this.widget.title,
                      style: tstyle,
                      maxLines: 3,
                    ),
                  ),
                  CupertinoSwitch(
                    activeColor: Colours.black,
                    value: this.widget.onOrOff,
                    onChanged: (bool value) => _onValueChangedInternal(value),
                  ),
                ],
              ),
              Container(height: 0.5, color: Colours.white246),
            ],
          )),
    );
  }
}
