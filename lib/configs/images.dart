import 'package:flutter/material.dart';

const String imagePath = 'assets/images';
const String svgPath = 'assets/svg';

class OwnImage extends AssetImage {
  const OwnImage(String fileName) : super('$imagePath/$fileName');
}

class AppImages {
  static const logo = OwnImage('eyepax_logo.jpeg');

  static Future precacheAssets(BuildContext context) async {
    await precacheImage(logo, context);
  }
}
