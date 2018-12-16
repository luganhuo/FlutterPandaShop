import 'package:flutter/material.dart';

enum FontFamily {
  GothamBook,
  GothamMedium,
  GothamBold,
  PolarisBook,
  PolarisMedium,
  PolarisBold,
  PolarisHeavy,
  PolarisCondensedBook,
  PolarisCondensedBold,
  SFLight,
  SFMedium,
  SFBold,
  SFHeavy,
}

class PandaTextStyle {
  static TextStyle get gotham => TextStyle(
        fontFamily: _fontFamily(FontFamily.GothamBook),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get polaris => TextStyle(
        fontFamily: _fontFamily(FontFamily.PolarisBook),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get polarisCondensed => TextStyle(
        fontFamily: _fontFamily(FontFamily.PolarisCondensedBook),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get sfui => TextStyle(
        fontFamily: _fontFamily(FontFamily.SFLight),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  static String _fontFamily(FontFamily ff) {
    const Map<FontFamily, String> _allFontFamily = {
      FontFamily.GothamBook: "Gotham",
      FontFamily.GothamMedium: "Gotham",
      FontFamily.GothamBold: "Gotham",
      FontFamily.PolarisBook: "Polaris",
      FontFamily.PolarisMedium: "Polaris",
      FontFamily.PolarisBold: "Polaris",
      FontFamily.PolarisHeavy: "Polaris",
      FontFamily.PolarisCondensedBook: "PolarisCondensed",
      FontFamily.PolarisCondensedBold: "PolarisCondensed",
      FontFamily.SFLight: "SF-UI-Text",
      FontFamily.SFMedium: "SF-UI-Text",
      FontFamily.SFBold: "SF-UI-Text",
      FontFamily.SFHeavy: "SF-UI-Text",
    };
    return _allFontFamily[ff];
  }
}
