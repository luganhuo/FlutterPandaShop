import 'package:flutter/material.dart';
import 'package:pandashop/mockup/constants/constant_fonts.dart';

import '../../../constants/constant_colors.dart';
import '../../../constants/constant_spacing.dart';
import '../../../modules/me/components/component_radio_box.dart';
import '../../../modules/me/components/component_section_header.dart';
import '../../../translations.dart';

enum GenderEnum {
  women,
  men,
  secret,
}

class WidgetMeGenderChoice extends StatefulWidget {
  final GenderEnum gender;

  const WidgetMeGenderChoice({Key key, this.gender = GenderEnum.women}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WidgetMeGenderChoiceState();
}

class _WidgetMeGenderChoiceState extends State<WidgetMeGenderChoice> {
  GenderEnum gender;

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
            selected: gender == GenderEnum.women,
            onPressed: () {
              setState(() {
                gender = GenderEnum.women;
              });
            },
          ),
          RadioBox(
            title: Translations.of(context).text("men"),
            selected: gender == GenderEnum.men,
            onPressed: () {
              setState(() {
                gender = GenderEnum.men;
              });
            },
          ),
          SizedBox(height: Spacing.s),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  Translations.of(context).text("myShopFooter"),
                  style: PandaTextStyle.polaris.copyWith(fontSize: 12, color: Colours.white34, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
