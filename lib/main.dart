import 'package:eyepax_assignment/screen/landing/home_main.dart';
import 'package:eyepax_assignment/utils/rought.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eyepax_assignment/configs/colors.dart';
import 'package:eyepax_assignment/notifire/eyepax_notifire.dart';
import 'package:eyepax_assignment/screen/splash/splash_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => EyePaxNotifier(),
      child: App(),
    ),
  );
}

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, //top bar color
      ),
    );
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouterScreen.generateRoute,
      theme: ThemeData(
        canvasColor: AppColors.whiteColor,
        fontFamily: 'New York',
      ),
      home: SplashPage(),
    );
  }
}
