import 'package:flutter/material.dart';

class DimensionHelper {
  final BuildContext context;

  DimensionHelper(this.context);

  // Screen dimensions
  double get screenWidth =>
      MediaQuery
          .of(context)
          .size
          .width;

  double get screenHeight =>
      MediaQuery
          .of(context)
          .size
          .height;

  // Percentage-based dimensions
  double widthPercentage(double percentage) => screenWidth * (percentage / 100);

  double heightPercentage(double percentage) =>
      screenHeight * (percentage / 100);

  // Orientation helpers
  bool get isPortrait =>
      MediaQuery
          .of(context)
          .orientation == Orientation.portrait;

  bool get isLandscape =>
      MediaQuery
          .of(context)
          .orientation == Orientation.landscape;

  // Device-specific helpers
  double get pixelRatio =>
      MediaQuery
          .of(context)
          .devicePixelRatio;

  bool get isSmallDevice => screenWidth < 360;

  // Text sizes
  double get textExtraSmall => screenHeight * 0.013;

  double get textSmall => screenHeight * 0.015;

  double get textNormalSmall => screenHeight * 0.016;

  double get textNormal => screenHeight * 0.018;

  double get textSemiMedium => screenHeight * 0.020;

  double get textSemiMedium1 => screenHeight * 0.022;

  double get textMedium => screenHeight * 0.025;

  double get textLarge => screenHeight * 0.030;

  double get textExtraLarge => screenHeight * 0.040;

  // Padding sizes
  double get paddingSmall => screenHeight * 0.010;

  double get paddingMedium => screenHeight * 0.015;

  double get paddingLarge => screenHeight * 0.020;

  // Bottom bar icon size
  double get bottomBarIconSize => screenWidth * 0.09;
}
