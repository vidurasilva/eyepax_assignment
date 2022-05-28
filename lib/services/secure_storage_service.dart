// secure_storage_service.dart:
// We do not store user credentials, API tokens, secret API keys in local storage,
//for that we make use of flutter_secure_storage which stores data in the Android Keystore and Apple keychain with
//platform-specific encryption technique.In this file, there will be getters and setters for each and every data
// to be stored in platform secure storage.

import 'package:eyepax_assignment/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
    return _db!;
  }

  initDatabase() async {
    String path = join(await getDatabasesPath(), 'eyepax_assignment.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
      """CREATE TABLE Users(id INTEGER PRIMARY KEY AUTOINCREMENT, user_full_name TEXT UNIQUE, email TEXT, user_mobile_number TEXT,password TEXT,creat_datetime TEXT, isEnable TEXT)""",
    );
  }

  //************************* Start manege User details from data base ***********************************//

  Future<String> userRegister(UserModel newUser) async {
    print("Inside the save Users method");
    var dbClient = await db;
    String status = '${newUser.email!}, email address is already exceeded';
    List<Map> maps = await dbClient
        .rawQuery("SELECT * FROM Users WHERE email = '" + newUser.email! + "'");
    if (maps.length == 0) {
      await dbClient.insert(
        'Users',
        newUser.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      status = 'Success';
    }
    return status;
  }

  Future<List<UserModel>> readUserData() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.rawQuery('SELECT * FROM Users');
    // print('User Data :' + jsonEncode(maps));
    List<UserModel> userList = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        userList.add(UserModel.fromJson(maps[i]));
      }
    }
    return userList;
  }

  Future<List<UserModel>> userSignIn(String email, String password) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.rawQuery(
        "SELECT * FROM Users WHERE email = '" +
            email +
            "' AND password ='" +
            password +
            "'");
    List<UserModel> userList = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        userList.add(UserModel.fromJson(maps[i]));
      }
    }
    return userList;
  }

  Future<void> setUserEnable(String email) async {
    var dbClient = await db;
    await dbClient.update('Users', {'isEnable': '1'},
        where: "email = ? ", whereArgs: [email]);
  }
  //************************* End manege User details from data base ***********************************//

}
