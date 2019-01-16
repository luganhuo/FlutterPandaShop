import 'package:flutter/material.dart';
import 'package:flutter_panda_appkit/flutter_panda_appkit.dart';
import 'package:flutter_panda_foundation/flutter_panda_foundation.dart';

import '../../core/multi_lang/translations.dart';
import '../../core/route/panda_routable_model.dart';
import '../../features/routes/panda_feature_helper.dart';
import '../../modules/signUpAndSignIn/widgets/widget_signup_email.dart';
import '../../modules/signUpAndSignIn/widgets/widget_signup_legal.dart';
import '../../modules/signUpAndSignIn/widgets/widget_signup_title.dart';
//import '../../component/button/button.dart';
//import '../../constants/constant_colors.dart';
//import '../../constants/constant_fonts.dart';
//import '../../constants/constant_images.dart';
//import '../../constants/constant_spacing.dart';

//import '../../utils/image_in_assets.dart';
//import '../../utils/keyboard_utils.dart';

class WindowSignUp extends StatefulWidget implements PandaFeatureProviderProtocol {
  static List<PandaRoutableModel> allFeatureRoutes() {
    return [
      PandaRoutableModel(
        route: "/signup",
        handler: RouteHandler(
          handlerFunc: (BuildContext context, Map<String, List<dynamic>> params) {
            return WindowSignUp();
          },
          type: RouteHandleType.route,
        ),
        transitionType: RouteTransitionType.nativeModal,
      )
    ];
  }

  @override
  _WindowSignUpState createState() => _WindowSignUpState();
}

class _WindowSignUpState extends State<WindowSignUp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => dismissKeyboard(context),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          actions: <Widget>[
            Center(
              child: Text(
                Translations.of(context).text("loginTitle"),
                style: PandaTextStyle.sfui.copyWith(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(width: Spacing.m),
          ],
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              WidgetSignupTitle(),
              WidgetSignUpMethod(),
              WidgetSignUpLegalWarning(),
              Container(
                padding: EdgeInsets.fromLTRB(Spacing.m, Spacing.xs, Spacing.m, 0),
                child: Button(
                  title: "下一步",
                  accessoryIcon: ImageInAssets(name: Images.indicator_arrow_r).image(color: Colours.white),
                  onPressed: () => debugPrint("next step pressed"),
                  style: ButtonStyle(type: ButtonType.primary),
                ),
              ),
//              Spacer(),
//              WidgetSignUpSeparatorLine(),
//              WidgetSignUpOauthFromWeChat(),
            ],
          ),
        ),
      ),
    );
  }
}
