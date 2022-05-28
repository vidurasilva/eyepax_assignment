import 'package:flutter/material.dart';

double getScreenHeight(BuildContext context, double height) {
  double screenHeight;
  double designScreenHeight = 712.0;

  MediaQueryData mediaQuery = MediaQuery.of(context);
  double _screenHeight = mediaQuery.size.height;
  screenHeight = (height / designScreenHeight) * _screenHeight;

  return screenHeight;
}

double getScreenWidth(BuildContext context, double width) {
  double screenWidth;
  double designScreenWidth = 360.0;

  MediaQueryData mediaQuery = MediaQuery.of(context);
  double _screenWidth = mediaQuery.size.width;
  screenWidth = (width / designScreenWidth) * _screenWidth;

  return screenWidth;
}

double setSp(BuildContext context, double fontSize) {
  double designScreenWidth = 480.0; // 360
  double maxWidth = 562.5;
  double screenWidth;
  if (MediaQuery.of(context).size.width > 562.5) {
    screenWidth = (maxWidth / designScreenWidth);
  } else {
    screenWidth = (MediaQuery.of(context).size.width / designScreenWidth);
  }
  return fontSize * screenWidth;
}
