import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:eyepax_assignment/constant/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InternetConnectionChecker {
  Future<ConnectivityResult?> updateConnectionStatus() async {
    ConnectivityResult? result;
    String connectionStatus = 'Unknown';
    BuildContext context;
    // print('Inside the internet checker');
    try {
      result = await Connectivity().checkConnectivity();

      switch (result) {
        case ConnectivityResult.wifi:
          {
            // print('Connectivity Result is :wifi');
          }
          break;
        case ConnectivityResult.mobile:
          {
            // print('Connectivity Result is :mobile');
          }
          break;
        case ConnectivityResult.none:
          {
            // print('Connectivity Result is :None');
          }
          break;
        default:
          connectionStatus = 'Failed to get connectivity.';
          break;
      }
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }
}

Future<bool> tempInternetConnectionChecker({int? second}) async {
  InternetConnectionChecker interNetChecker = InternetConnectionChecker();
  bool returnBool = true;
  await interNetChecker.updateConnectionStatus().then((connectionvalue) async {
    if (connectionvalue == ConnectivityResult.none) {
      returnBool = false;
      Fluttertoast.showToast(
          msg: ScreenContentText.pleaceCheckInternet,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: second!,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  });
  return returnBool;
}
