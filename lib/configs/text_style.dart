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

//** See All style **//
TextStyle seeAll() {
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.secondoryColor, //Colors.black,
  );
}

//** CategoryText **//
TextStyle selectedCategoryText() {
  return TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor, //Colors.black,
  );
}

TextStyle unSelectedCategoryText() {
  return TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black, //Colors.black,
  );
}

//** News Box Style **//
TextStyle byAuther() {
  return TextStyle(
      fontFamily: 'Nunito',
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 16.0);
}

TextStyle titleStyle() {
  return TextStyle(
      fontFamily: 'Nunito',
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 20.0);
}

TextStyle topCardTextstyle() {
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );
}

TextStyle descriptionStyle() {
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
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
