// rest_api_service.dart:
// We do call the rest API to get, store data on a remote database for that we need to write
//the rest API call at a single place and need to return the data if the rest call is a success
// or need to return custom error exception on the basis of 4xx, 5xx status code. We can make
//use of http package to make the rest API call in the flutter.

import 'dart:convert';
import 'package:eyepax_assignment/configs/url.dart';
import 'package:eyepax_assignment/services/internet_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

fetchProcessedData(String url,
    {Function(String)? success,
    Function(String, String, String)? failed,
    error,
    completed}) async {
  await tempInternetConnectionChecker(second: 3).then((value) async {
    String? data;
    if (value) {
      data = await fetchData(url);
      try {
        success!(data);
      } catch (e) {
        failed!("", "Something went wrong", "Please try agian later");
        if (error != null) {
          error();
        }
      } finally {
        if (completed != null) {
          completed();
        }
      }
    } else {
      success!(data!);
    }
  });
}

Future<String> fetchData(String url) async {
  try {
    // final response =
    //     await http.post(Uri.https(APIConstants.MAIN_BASE_URL, url), body: map);
    final response = await http.get(
      Uri.https(APIConstants.MAIN_BASE_URL, url),
    );
    print(
        'response of ${APIConstants.MAIN_BASE_URL}$url is : ${response.body}');
    if (response.statusCode == 200) {
      final String responceString = response.body;
      return responceString;
    } else {
      Fluttertoast.showToast(
          msg: "error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 4,
          backgroundColor: Colors.red[900],
          textColor: Colors.white,
          fontSize: 16.0);
      return 'error';
    }
  } catch (Exception) {
    print("Exception " + Exception.toString() + '100');
  }
  return '';
}
