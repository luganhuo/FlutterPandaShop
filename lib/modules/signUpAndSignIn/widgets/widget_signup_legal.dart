import 'package:flutter/widgets.dart';

import '../../../constants/constant_spacing.dart';
import '../../../modules/me/components/component_check_box.dart';

class WidgetSignUpLegalWarning extends StatefulWidget {
  _WidgetSignUpLegalWarningState createState() => _WidgetSignUpLegalWarningState();
}

class _WidgetSignUpLegalWarningState extends State<WidgetSignUpLegalWarning> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(Spacing.m, Spacing.xs, Spacing.m, Spacing.m),
      child: Wrap(
        children: [
          CheckBox(
            title: "您接受并同意遵守我们的条款与条件、隐私政策、以及个人敏感信息政策。",
            onOrOff: false,
            onPressed: (bool newValue) => debugPrint("switch tapped."),
          ),
        ],
      ),
    );
  }
}
