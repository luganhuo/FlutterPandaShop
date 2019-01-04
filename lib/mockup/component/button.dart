import 'package:flutter/material.dart';

import '../constants/constant_border_radius.dart';
import '../constants/constant_colors.dart';
import '../constants/constant_spacing.dart';

enum ButtonType { primary, secondary, tertiary, flat }

enum ButtonLayout { fluid, block }

enum ButtonIconAlign { left, right }

class Button extends StatelessWidget {
  final String title;
  final Widget icon;
  final Widget accessoryIcon;
  final EdgeInsets contentEdgetInsets;
  final ButtonStyle style;
  final bool inverted;
  final ButtonLayout layout;
  final ButtonIconAlign iconAlign;
  final GestureTapCallback onPressed;

  Button({
    Key key,
    this.title,
    this.icon,
    this.accessoryIcon,
    @required this.onPressed,
    this.layout = ButtonLayout.fluid,
    this.iconAlign = ButtonIconAlign.right,
    this.contentEdgetInsets = const EdgeInsets.fromLTRB(Spacing.s, Spacing.s + Spacing.xxxs, Spacing.s, Spacing.s + Spacing.xxxs),
    this.style = const ButtonStyle(type: ButtonType.primary),
    this.inverted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: this.contentEdgetInsets,
      shape: BorderRadiusDef.cornerRadius4,
      child: Text(
        this.title,
        style: TextStyle(color: this.style.textColor()),
      ),
      fillColor: this.style.backgroundColor(),
      highlightColor: this.style.backgroundColor(inverted: true).withAlpha(128),
      animationDuration: Duration(milliseconds: 40),
      onPressed: this.onPressed,
    );
  }
}

class ButtonStyle {
  final ButtonType type;

  const ButtonStyle({this.type});

  // constants
  static const double _buttonBorderWidth = 1.0;
  static const double _tertiaryBorderColorAlpha = 0.1;

  Color textColor({bool inverted = false}) {
    switch (this.type) {
      case ButtonType.primary:
        return inverted ? Colours.dark : Colours.white;

      case ButtonType.secondary:
        return Colours.dark;

      case ButtonType.tertiary:
        return inverted ? Colours.white : Colours.dark;

      case ButtonType.flat:
        return inverted ? Colours.white : Colours.dark;

      default:
        return Colours.dark;
    }
  }

  Color backgroundColor({bool inverted = false}) {
    switch (this.type) {
      case ButtonType.primary:
        return inverted ? Colours.white : Colours.dark;

      case ButtonType.secondary:
        return Colours.grey;

      case ButtonType.tertiary:
      case ButtonType.flat:
        return Colours.white;

      default:
        return Colours.white;
    }
  }

  Color borderColor({bool inverted = false}) {
    switch (this.type) {
      case ButtonType.primary:
      case ButtonType.secondary:
      case ButtonType.flat:
        return Colours.clear;

      case ButtonType.tertiary:
        return inverted ? Colours.white.withAlpha((_tertiaryBorderColorAlpha * 255).toInt()) : Colours.dark.withAlpha((_tertiaryBorderColorAlpha * 255).toInt());

      default:
        return Colours.clear;
    }
  }

  double borderWidth() {
    switch (this.type) {
      case ButtonType.primary:
      case ButtonType.secondary:
      case ButtonType.flat:
        return 0.0;

      case ButtonType.tertiary:
        return _buttonBorderWidth;

      default:
        return 0.0;
    }
  }
}
