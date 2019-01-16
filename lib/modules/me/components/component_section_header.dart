import 'package:flutter/material.dart';
import 'package:flutter_panda_foundation/flutter_panda_foundation.dart';
//import '../../../constants/constant_fonts.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final double height;

  const SectionHeader({Key key, this.title, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      child: Row(
        children: <Widget>[
          Text(
            this.title,
            style: PandaTextStyle.polaris.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
