import 'package:flutter/material.dart';

const String treMS = 'TrebuchetMS';

class CustomColor {
  static Color? color1_bg_bluegrey = Colors.blueGrey[900];
  static Color? color2_font_white = Colors.white;
  static Color? color3_green_accent = Colors.greenAccent;
}

class CustomButtonStyle {
  static ButtonStyle buttonStyleTransparent = ElevatedButton.styleFrom(
    primary: Colors.transparent,
  );
  static ButtonStyle buttonStyleFilled = ElevatedButton.styleFrom(
      shadowColor: Colors.white, elevation: 20, primary: Colors.greenAccent);
}

class TextFontStyle {
  static TextStyle textStyle1(Color color, double? size) {
    return TextStyle(
      color: color,
      fontFamily: treMS,
      fontSize: size,
    );
  }
}
