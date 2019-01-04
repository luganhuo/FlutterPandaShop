import 'package:flutter/material.dart';

class BorderRadiusDef {
  static RoundedRectangleBorder get cornerRadius4 => _cornerRadiusCustom(4.0);
  static RoundedRectangleBorder get cornerRadius6 => _cornerRadiusCustom(6.0);

  static RoundedRectangleBorder _cornerRadiusCustom(radius) {
    return RoundedRectangleBorder(
      side: BorderSide(style: BorderStyle.none),
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    );
  }
}
