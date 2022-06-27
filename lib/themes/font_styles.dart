
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todobooks/themes/colors.dart';

class TextStyles {
  // static const TextStyle default = Color(0xFF29A19C);

  static TextStyle getDefaultFontStyle({double? fontSize, Color? fontColor, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: fontSize ?? 18,
      color: fontColor ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.normal,
      fontFamily: 'Nunito'
    );
  }

  static TextStyle getHyperlinkFontStyle({double? fontSize, Color? fontColor, FontWeight? fontWeight}) {
    return TextStyle(
        fontSize: fontSize ?? 18,
        color: CustomColor.color29A19C,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.underline,
        fontFamily: 'Nunito'
    );
  }
}