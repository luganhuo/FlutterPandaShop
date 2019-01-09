import 'package:flutter/material.dart';

import '../../../constants/constant_colors.dart';
import '../../../constants/constant_fonts.dart';
import '../../../constants/constant_images.dart';
import '../../../constants/constant_spacing.dart';
import '../../../utils/image_in_assets.dart';

class DataSelector extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback onPressed;

  const DataSelector({Key key, this.icon, @required this.title, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 47,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    this.icon == null
                        ? Container(height: 0)
                        : Container(
                            child: Row(
                              children: <Widget>[this.icon, SizedBox(width: Spacing.s + Spacing.xs + Spacing.xxxxs)],
                            ),
                          ),
                    Expanded(
                      child: Text(
                        this.title,
                        style: PandaTextStyle.polaris.copyWith(fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                    ),
                    ImageInAssets(name: Images.indicator_arrow_r).image(),
                  ],
                ),
              ),
              Container(
                height: 0.5,
                color: Colours.white246,
              )
            ],
          ),
          onTap: this.onPressed,
        ));
  }
}
