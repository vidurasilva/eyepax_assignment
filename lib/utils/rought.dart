import 'package:eyepax_assignment/constant/router_path.dart';
import 'package:eyepax_assignment/models/artical_model.dart';
import 'package:eyepax_assignment/screen/landing/home_main.dart';
import 'package:eyepax_assignment/screen/landing/landing_page.dart';
import 'package:eyepax_assignment/screen/news_page/singal_news_data.dart';
import 'package:eyepax_assignment/screen/splash/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouterScreen {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ScreenConstant.toSplashPage:
        return MaterialPageRoute(builder: (_) => SplashPage());

      case ScreenConstant.toHomeMain:
        return MaterialPageRoute(builder: (_) => HomeMain());

      case ScreenConstant.toLandingPage:
        return MaterialPageRoute(builder: (_) => LandingPage());

      case ScreenConstant.toSingalNewsPage:
        final arguments = settings.arguments as Map;
        final Article article = arguments['article'];
        return MaterialPageRoute(builder: (_) => SingalNews(article: article));

      // case ScreenConstant.toClassPage:
      //   final arguments = settings.arguments as Map;
      //   final int grade = arguments['grade'];
      //   final String classType = arguments['classType'];
      //   return MaterialPageRoute(
      //       builder: (_) => ClassPage(grade: grade, classType: classType));

      // case ScreenConstant.toSummaryPage:
      //   final arguments = settings.arguments as Map;
      //   final String date = arguments['date'];
      //   return MaterialPageRoute(builder: (_) => SummaryPage(date: date));
//
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

// Map<String, dynamic> map = {'isContinua': 0,'order_id':'SE12'};
//    Navigator.pushNamed(context, ScreenConstant.toSuccessfulOrder,arguments: map);
//    Navigator.pushNamed(context, ScreenConstant.toClassPage);
