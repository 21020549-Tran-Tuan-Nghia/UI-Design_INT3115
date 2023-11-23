import 'package:flutter/material.dart';

// Since the CSS Pixel Ratio of Pixel 4 XL is 3.5, however, our pixel ratio is 4,
// we will use viewportRatio to get the real number of size to match the viewport
// of Pixel 4 XL.
const double viewportRatio = 412.0 / 360.0;

// Color Styles
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

// Text Styles [Heading, Subheading, SmallButton]
class HeadingStyle extends TextStyle {
  final Color newColor;
  final FontWeight weight;
  final double size;
  final String family;

  const HeadingStyle({
    this.newColor = Colors.black,
    this.size = 24 * viewportRatio,
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
    this.size = 16 * viewportRatio,
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
    this.size = 16 * viewportRatio,
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

class UnitTitleStyle extends TextStyle {
  final Color newColor;
  final FontWeight weight;
  final double size;
  final String family;

  const UnitTitleStyle({
    this.newColor = Colors.black,
    this.size = 16 * viewportRatio,
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

class UnitSubTitleStyle extends TextStyle {
  final Color newColor;
  final FontWeight weight;
  final double size;
  final String family;

  const UnitSubTitleStyle({
    this.newColor = Colors.black,
    this.size = 12 * viewportRatio,
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

// Shape Styles
abstract class ShapeStyles {
  static const double cornerRadius = 12 * viewportRatio;
  static const double strokeWidth = 2 * viewportRatio;
}

abstract class LessonStyles {
  static const List<double> bottomPaddings = [
    6 * viewportRatio,
    12 * viewportRatio,
    12 * viewportRatio,
    6 * viewportRatio
  ];
  static const List<double> leftPaddings = [
    0,
    100 * viewportRatio,
    174 * viewportRatio,
    100 * viewportRatio,
    0,
    0,
    0,
    0,
    0
  ];
  static const List<double> rightPaddings = [
    0,
    0,
    0,
    0,
    0,
    100 * viewportRatio,
    174 * viewportRatio,
    100 * viewportRatio,
    0
  ];
}
