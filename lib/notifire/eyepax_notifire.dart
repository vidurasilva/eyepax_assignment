import 'package:eyepax_assignment/models/artical_model.dart';
import 'package:eyepax_assignment/models/user_model.dart';
import 'package:eyepax_assignment/services/secure_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class EyePaxNotifier extends ChangeNotifier {
  DBHelper dbHelper = DBHelper();
  UserModel userData = UserModel();
  bool starterProgres = true;
  List<Article> articles = [];

  getNewsData(Result newsList) async {
    articles = newsList.articles!;
    print(' ++++++ Get News Data ++++++ ');
    notifyListeners();
  }

  getUserData() async {
    await dbHelper.readUserData().then((value) {
      if (value.length > 0) {
        userData = value[0];
      }
    });
    notifyListeners();
  }
}
