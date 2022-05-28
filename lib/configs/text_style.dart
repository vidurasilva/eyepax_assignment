import 'package:eyepax_assignment/configs/colors.dart';
import 'package:eyepax_assignment/configs/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Splash Page Style//
TextStyle splashTextstyle() {
  return TextStyle(
      color: AppColors.primaryColor,
      fontSize: 30,
      fontFamily: AppFonts.loremIpsum);
}

//**sign in & sign up screen text styles**//
TextStyle signInTopTextstyle(BuildContext context) {
  return TextStyle(color: AppColors.secondoryColor, fontSize: 30);
}

//** Search bar style **//
TextStyle searchBarTextstyle(BuildContext context) {
  return TextStyle(
    fontSize: 20,
    // color: AppColors.grey,
    height: 1,
  );
}

//** Grid Data style **//
TextStyle seeAll() {
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.secondoryColor, //Colors.black,
  );
}

//** Topic Data style **//
TextStyle topicTextstyle() {
  return TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.bold,
    color: AppColors.secondoryColor, //Colors.black,
  );
}

//** Grade bar style **//
TextStyle singalGradeCardTextstyle(BuildContext context) {
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}

//** Grade bar style **//
TextStyle topCardTextstyle() {
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}

//** QR bar style **//
TextStyle topOnButtonTextstyle() {
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.secondoryColor,
  );
}

TextStyle topOffButtonTextstyle() {
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.secondoryColor,
  );
}

//**circuler progras indicator**//
TextStyle circularProgressIndicatorTextstyle() {
  return TextStyle(color: Colors.white, fontSize: 16.0);
}

TextStyle circularProgressIndicatorTextstyleBlue() {
  return TextStyle(color: Colors.blueAccent, fontSize: 16.0);
}
