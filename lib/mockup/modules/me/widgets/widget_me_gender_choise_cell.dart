import 'package:flutter/material.dart';


import '../../../constants/constant_colors.dart';
import '../../../constants/constant_fonts.dart';
import '../../../constants/constant_spacing.dart';
import '../../../modules/models/ModelEnums.dart';
import '../../../modules/me/components/component_radio_box.dart';
import '../../../modules/me/components/component_section_header.dart';
import '../../../translations.dart';


class WidgetMeGenderChoice extends StatefulWidget {
  final GenderType gender;

  const WidgetMeGenderChoice({Key key, this.gender = GenderType.Woman}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WidgetMeGenderChoiceState();
}

class _WidgetMeGenderChoiceState extends State<WidgetMeGenderChoice> {
  GenderType gender;

  _WidgetMeGenderChoiceState({this.gender}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(Spacing.m, Spacing.s, Spacing.m, Spacing.m),
      color: Colours.white,
      child: Column(
        children: <Widget>[
          SectionHeader(
            title: Translations.of(context).text("myShop"),
            height: 28,
          ),
          SizedBox(height: Spacing.s),
          RadioBox(
            title: Translations.of(context).text("women"),
            selected: gender == GenderType.Woman,
            onPressed: () {
              setState(() {
                gender = GenderType.Woman;
              });
            },
          ),
          RadioBox(
            title: Translations.of(context).text("men"),
            selected: gender == GenderType.Man,
            onPressed: () {
              setState(() {
                gender = GenderType.Man;
              });
            },
          ),
          SizedBox(height: Spacing.s),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  Translations.of(context).text("myShopFooter"),
                  style: PandaTextStyle.polaris.copyWith(fontSize: 12, color: Colours.dark, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
