import 'package:flutter/material.dart';

import '../../component/tab_bar_icon_item.dart';
import '../../component/textfield/input_field.dart';
import '../../component/textfield/input_field_interface.dart';
import '../../component/textfield/input_field_sms.dart';
import '../../constants/constant_colors.dart';
import '../../constants/constant_fonts.dart';
import '../../constants/constant_images.dart';
import '../../constants/constant_spacing.dart';
import '../../core/multi_lang/translations.dart';
import '../../modules/protocols/protocol_main_page.dart';
import '../../modules/protocols/protocol_tab_bar_item.dart';
import '../../utils/image_in_assets.dart';

class WishListWindow extends StatefulWidget implements MainPageProtocol {
  _WishListWindowState createState() => _WishListWindowState();

  @override
  Widget navigatorHeaderView(BuildContext context) {
    return Text(Translations.of(context).text("tabbarItemWishlistTitle"));
  }

  @override
  List<Widget> navigatorLeftButtons(BuildContext context) {
    return null;
  }

  @override
  List<Widget> navigatorRightButtons(BuildContext context) {
    return null;
  }

  @override
  TabBarItemProtocol tabBarItem(BuildContext context) {
    return TabBarIconItem(
        title: Translations.of(context).text("tabbarItemWishlistTitle"),
        icon: ImageIcon(ImageInAssets(name: Images.wishlist_offstate_icon).assetImage()),
        activeIcon: ImageIcon(ImageInAssets(name: Images.wishlist_onstate_icon).assetImage()));
  }
}

class _WishListWindowState extends State<WishListWindow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Spacing.s),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Wish List"),
          SizedBox(height: 8),
          InputField(
            text: "hello world",
            obscureMode: false,
            textStyle: PandaTextStyle.polaris.copyWith(fontSize: 17, fontWeight: FontWeight.w500),
            prefixView: Text("+86", style: PandaTextStyle.polaris.copyWith(fontSize: 17, fontWeight: FontWeight.w500)),
            hintView: Text("输入错误", style: PandaTextStyle.polaris.copyWith(color: Colours.red, fontSize: 14, fontWeight: FontWeight.w500)),
            inputState: InputFieldState.normal,
            shouldChangeText: (newValue) {
              return (newValue.length <= "hello world".length);
            },
            onTextDidChanged: (newValue) => print(newValue),
            onTextEndEditing: (newValue) => print("input field did end editing: $newValue"),
            stateOfChangedText: (newValue) {
              const String sample = "hello world";
              if (newValue.length < sample.length) {
                return InputFieldState.normal;
              } else {
                return (newValue == sample ? InputFieldState.correct : InputFieldState.wrong);
              }
            },
          ),
          InputFieldSMS(
            maxLength: 6,
            hintView: Text(
              "验证码不正确，请重新输入",
              style: PandaTextStyle.sfui.copyWith(
                color: Colours.red,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            shouldChangeText: (newValue) {
              return (newValue.length <= 6);
            },
            onTextDidChanged: (newValue) => print(newValue),
            onTextEndEditing: (newValue) => print("input field did end editing: $newValue"),
            stateOfChangedText: (newValue) {
              const String sample = "123456";
              if (newValue.length < sample.length) {
                return InputFieldState.normal;
              } else {
                return (newValue == sample ? InputFieldState.correct : InputFieldState.wrong);
              }
            },
          ),
        ],
      ),
    );
  }
}
