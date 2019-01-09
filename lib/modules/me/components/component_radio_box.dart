import 'package:flutter/material.dart';

import '../../../constants/constant_colors.dart';
import '../../../constants/constant_fonts.dart';
import '../../../constants/constant_images.dart';
import '../../../utils/image_in_assets.dart';

class RadioBox extends StatelessWidget {
  final String title;
  final bool selected;
  final double height;
  final VoidCallback onPressed;

  const RadioBox({Key key, @required this.title, this.selected = false, this.height = 46.0, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var radioBoxImageStr = this.selected ? Images.radio_button_selected : Images.radio_button;

    return Container(
      color: Colours.clear,
      height: this.height,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      this.title,
                      style: PandaTextStyle.polaris.copyWith(fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                  ),
                  ImageInAssets(name: radioBoxImageStr).image(),
                ],
              ),
            ),
            Container(
              color: Colours.white246,
              height: 0.5,
            ),
          ],
        ),
        onTap: this.onPressed,
      ),
    );
  }

//  _RadioBoxState createState() => _RadioBoxState(title: this.title, selected: this.selected, height: this.height, onPressed: this.onPressed);
//}
//
//class _RadioBoxState extends State<RadioBox> {
//  String title;
//  bool selected;
//  double height;
//  VoidCallback onPressed;
//
//  _RadioBoxState({this.title, this.selected, this.height, this.onPressed}) : super();
//
//  @override
//  Widget build(BuildContext context) {
//    String radioBoxImageStr = Images.radio_button;
//    if (this.selected) {
//      print('???');
//      radioBoxImageStr = Images.radio_button_selected;
//    }
//
//    return Container(
//        color: Colours.clear,
//        height: this.height,
//        child: GestureDetector(
//          behavior: HitTestBehavior.opaque,
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Expanded(
//                child: Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: Text(
//                        this.title,
//                        style: PandaTextStyle.polaris.copyWith(fontSize: 15, fontWeight: FontWeight.w500),
//                      ),
//                    ),
//                    ImageInAssets(name: radioBoxImageStr).image(),
//                  ],
//                ),
//              ),
//              Container(
//                color: Colours.white246,
//                height: 0.5,
//              ),
//            ],
//          ),
//          onTap: this.onPressed,
//        ));
//  }
}
