import 'package:flutter/material.dart';

class Colours {
  static Color get clear => Color.fromRGBO(255, 255, 255, 0.0);
  static Color get black => _colorWhite(0);
  static Color get white => _colorWhite(255);
  static Color get white17 => _colorWhite(17);
  static Color get white34 => _colorWhite(34);
  static Color get white68 => _colorWhite(68);
  static Color get white136 => _colorWhite(136);
  static Color get white216 => _colorWhite(216);
  static Color get white246 => _colorWhite(246);

  static Color _colorWhite(val) => Color.fromRGBO(val, val, val, 1.0);
}
