import 'package:flutter/material.dart';

import '../../constants/constant_colors.dart';
import '../../constants/constant_spacing.dart';
import '../border_style.dart';

enum ButtonType { primary, secondary, tertiary, flat }

enum ButtonLayout { fluid, block }

enum ButtonIconAlign { left, right }

class Button extends StatelessWidget {
  final String title;
  final Widget icon;
  final Widget accessoryIcon;
  final double fontSize;
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
    this.fontSize = 15.0,
    @required this.onPressed,
    this.layout = ButtonLayout.fluid,
    this.iconAlign = ButtonIconAlign.right,
    this.contentEdgetInsets =
        const EdgeInsets.fromLTRB(Spacing.s, Spacing.s, Spacing.s, Spacing.s),
    this.style = ButtonStyle.defaultStyle,
    this.inverted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = List<Widget>();

    if (this.icon != null) children.add(this.icon);
    if (this.title != null && this.title.isNotEmpty) {
      if (children.isNotEmpty) {
        children.add(SizedBox(width: Spacing.xs + Spacing.xxxs));
      }
      children.add(Expanded(
        child: Container(
          child: Text(
            this.title,
            style: TextStyle(
                fontSize: this.fontSize,
                fontWeight: FontWeight.w500,
                color: this.style.textColor()),
            textAlign: this.style.textAlign(),
          ),
        ),
      ));
      children.add(SizedBox(width: Spacing.xs + Spacing.xxxs));
    }
    if (this.accessoryIcon != null) children.add(this.accessoryIcon);

    return RawMaterialButton(
      padding: this.contentEdgetInsets,
      shape:
          BoarderStyleBuilder.borderBuilder(borderColor: style.borderColor()),
      child: Row(
        children: children,
      ),
      fillColor: this.style.backgroundColor(),
      highlightColor: this.style.highlightColor(),
      animationDuration: Duration(milliseconds: 40),
      onPressed: this.onPressed,
      elevation: 0,
      highlightElevation: 0,
      disabledElevation: 0.0,
    );
  }
}

class ButtonStyle {
  final ButtonType type;
  final ButtonLayout layout;

  const ButtonStyle({this.layout = ButtonLayout.fluid, this.type});

  static const ButtonStyle defaultStyle =
      ButtonStyle(type: ButtonType.primary, layout: ButtonLayout.fluid);

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

  TextAlign textAlign() {
    if (this.layout == ButtonLayout.fluid) {
      return TextAlign.center;
    } else if (this.layout == ButtonLayout.block) {
      return TextAlign.start;
    } else {
      return TextAlign.start;
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
        return inverted ? Colours.grey : Colours.white;

      default:
        return Colours.white;
    }
  }

  Color highlightColor() {
    if (this.type == ButtonType.secondary)
      return Colours.white.withAlpha(128);
    else
      return this.backgroundColor(inverted: true).withAlpha(128);
  }

  Color borderColor({bool inverted = false}) {
    switch (this.type) {
      case ButtonType.primary:
      case ButtonType.secondary:
      case ButtonType.flat:
        return Colours.clear;

      case ButtonType.tertiary:
        return inverted
            ? Colours.white.withAlpha((_tertiaryBorderColorAlpha * 255).toInt())
            : Colours.dark.withAlpha((_tertiaryBorderColorAlpha * 255).toInt());

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
