import 'package:flutter/material.dart';

class Colours {
  static Color get clear => Color.fromRGBO(255, 255, 255, 0.0);

  static Color get dark => _colorHex(0xFF222222);
  static Color get darkGrey => _colorHex(0xFFB6B6B6);
  static Color get grey => _colorHex(0xFFE6E6E6);
  static Color get lightGrey => _colorHex(0xFFF5F5F5);
  static Color get white => _colorHex(0xFFFFFFFF);
  static Color get darkPrivateClient => _colorHex(0xFF1A2028);
  static Color get gold => _colorHex(0xFFC4AA84);
  static Color get red => _colorHex(0xFFFC5D65);
  static Color get green => _colorHex(0xFF26D46D);
  static Color get bronze => _colorHex(0xFF75483E);
  static Color get silver => _colorHex(0xFF536477);
  static Color get platinum => _colorHex(0xFF474B53);
  static Color _colorHex(hex) {
    int value = hex & 0xffffffff;
    int a = (value & 0xff000000) >> 24;
    int r = (value & 0xff0000) >> 16;
    int g = (value & 0xff00) >> 8;
    int b = (value & 0xff);

    return Color.fromARGB(a, r, g, b);
  }

  static Color get black => _color(0);
  static Color get white17 => _color(17);
  static Color get white68 => _color(68);
  static Color get white136 => _color(136);
  static Color get white216 => _color(216);
  static Color get white246 => _color(246);
  static Color _color(val) => Color.fromRGBO(val, val, val, 1.0);
}
