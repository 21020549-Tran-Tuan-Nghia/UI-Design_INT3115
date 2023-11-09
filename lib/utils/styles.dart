import 'package:flutter/material.dart';

abstract class ColorStyles {
  // Main color
  static const Color lotusPink = Color(0xFFFF87D2);
  static const Color leafGreen = Color(0xFF56CD02);
  static const Color budYellow = Color(0xFFF4FF12);
  static const Color snowWhite = Color(0xFFFFFFFF);

  // Gray scale
  static const Color darkGray = Color(0xFF666666);
  static const Color semiDarkGray = Color(0xFF808080);
  static const Color mediumGray = Color(0xFFB3B3B3);
  static const Color gray = Color(0xFFCCCCCC);
  static const Color semiLightGray = Color(0xFFE6E6E6);
  static const Color lightGray = Color(0xFFF2F2F2);

  // Secondary
  static const Color darkPink = Color(0xFFD76AAB);
  static const Color mossGreen = Color(0xFF45A304);
  static const Color budNodeYellow = Color(0xFFC9C91F);
  static const Color earltLeafGreen = Color(0xFF9AE167);
  static const Color wrongRed = Color(0xFFFF4B4C);
  static const Color darkRed = Color(0xFFEA292C);
  static const Color lightRed = Color(0xFFFEC1C2);
  static const Color lightGreen = Color(0xFFB8F28B);
  static const Color gold = Color(0xFFFFC700);
  static const Color darkGold = Color(0xFFE6A000);
  static const Color lightGold = Color(0xFFFFE700);
  static const Color moreDarkGold = Color(0xFFCD7900);
  static const Color semiLightGreen = Color(0xFF6AE218);
  static const Color lightPink = Color(0xFFFAE2F3);
}

class HeadingStyle extends TextStyle {
  final Color newColor;
  final FontWeight weight;
  final double size;
  final String family;

  const HeadingStyle({
    this.newColor = Colors.black,
    this.size = 24,
    this.weight = FontWeight.w800,
    this.family = 'Nunito',
  }) : super(
          color: newColor,
          fontWeight: weight,
          fontSize: size,
          fontFamily: family,
          height: 0,
        );
}

class SubHeadingStyle extends TextStyle {
  final Color newColor;
  final FontWeight weight;
  final double size;
  final String family;

  const SubHeadingStyle({
    this.newColor = Colors.black,
    this.size = 16,
    this.weight = FontWeight.w600,
    this.family = 'Nunito',
  }) : super(
          color: newColor,
          fontWeight: weight,
          fontSize: size,
          fontFamily: family,
          height: 0,
        );
}

class SmallButtonStyle extends TextStyle {
  final Color newColor;
  final FontWeight weight;
  final double size;
  final String family;

  const SmallButtonStyle({
    this.newColor = Colors.black,
    this.size = 16,
    this.weight = FontWeight.w900,
    this.family = 'Nunito',
  }) : super(
          color: newColor,
          fontWeight: weight,
          fontSize: size,
          fontFamily: family,
          height: 0,
        );
}
