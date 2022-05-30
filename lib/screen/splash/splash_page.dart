import 'dart:async';
import 'package:eyepax_assignment/constant/app_constants.dart';
import 'package:eyepax_assignment/screen/landing/home_main.dart';
import 'package:eyepax_assignment/screen/landing/landing_page.dart';
import 'package:eyepax_assignment/services/native_api_service_helper.dart';
import 'package:eyepax_assignment/services/secure_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:eyepax_assignment/configs/colors.dart';
import 'package:eyepax_assignment/configs/images.dart';
import 'package:eyepax_assignment/screen/sign_up_&_in/sign_in.dart';
import 'package:eyepax_assignment/services/local_storage_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    scheduleMicrotask(() async {
      await nativeApiServiceHelper(context, APICallName.NEWS);
      await Future.delayed(Duration(milliseconds: 2000));
      read(SharedPreferencesConstant.USER_ID).then((value) {
        if (value == null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SignInPage()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LandingPage()),
          );
        }
      });
    });
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            image: AppImages.logo,
            width: (MediaQuery.of(context).size.width) * 0.80,
            height: (MediaQuery.of(context).size.height) * 0.75,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height) * 0.1,
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  try {
                    read(SharedPreferencesConstant.USER_ID).then((value) {
                      if (value == null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()),
                        );
                      } else {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => SpecialRemainders()),
                        // );
                      }
                    });
                  } catch (e) {}
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.4,
                  height: 60,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        AppColors.primaryColor,
                        AppColors.whiteColor
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Center(
                    child: Text(
                      'Get Started',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
