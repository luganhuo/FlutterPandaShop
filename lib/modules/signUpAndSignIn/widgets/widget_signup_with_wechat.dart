import 'package:ff_pdf_view/ff_pdf_view.dart';
import 'package:flutter/material.dart';

import '../../../component/button/button.dart';
import '../../../constants/constant_colors.dart';
import '../../../constants/constant_spacing.dart';
import '../../../core/multi_lang/translations.dart';

class WidgetSignUpOauthFromWeChat extends StatefulWidget {
  final VoidCallback onPressed;

  const WidgetSignUpOauthFromWeChat({Key key, this.onPressed}) : super(key: key);

  @override
  WidgetSignUpOauthFromWeChatState createState() {
    return new WidgetSignUpOauthFromWeChatState();
  }
}

class WidgetSignUpOauthFromWeChatState extends State<WidgetSignUpOauthFromWeChat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(Spacing.m, Spacing.xs + Spacing.s, Spacing.m, Spacing.m),
      color: Colours.darkGrey,
      child: Button(
        icon: PDFImage(sourceFile: "assets/pdf/WeChatLogo.pdf"),
        title: Translations.of(context).text("weChatAuthButtonTitle"),
        style: ButtonStyle(layout: ButtonLayout.fluid, type: ButtonType.primary).copyWith(colorBackground: Colours.weChatGreen),
        onPressed: this.widget.onPressed,
      ),
    );
  }
}
