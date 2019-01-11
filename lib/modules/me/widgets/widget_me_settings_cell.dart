import 'package:flutter/material.dart';

import '../../../constants/constant_colors.dart';
import '../../../constants/constant_spacing.dart';
import '../../../core/multi_lang/translations.dart';
import '../../../modules/me/components/component_check_box.dart';
import '../../../modules/me/components/component_data_selector.dart';
import '../../../modules/me/components/component_section_header.dart';

class WidgetMySettingsCell extends StatefulWidget {
  final bool enableAppId;

  const WidgetMySettingsCell({Key key, this.enableAppId}) : super(key: key);

  _WidgetMySettingsCellState createState() => _WidgetMySettingsCellState(enableAppId: this.enableAppId);
}

class _WidgetMySettingsCellState extends State<WidgetMySettingsCell> {
  bool enableAppId;

  _WidgetMySettingsCellState({this.enableAppId}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(Spacing.m, Spacing.s, Spacing.m, Spacing.m),
      color: Colours.white,
      child: Column(
        children: <Widget>[
          SectionHeader(
            title: Translations.of(context).text("mySettings"),
          ),
          SizedBox(height: Spacing.s),
          DataSelector(title: Translations.of(context).text("notifications"), onPressed: () => print('notifications pressed')),
          DataSelector(title: Translations.of(context).text("locationServices"), onPressed: () => print('locationServices pressed')),
          CheckBox(
              title: Translations.of(context).text("enableFaceIdTitle"),
              onOrOff: this.enableAppId,
              onPressed: (bool newValue) => setState(() {
                    this.enableAppId = !this.enableAppId;
                  }))
        ],
      ),
    );
  }
}
