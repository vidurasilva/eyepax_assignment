import 'package:eyepax_assignment/configs/colors.dart';
import 'package:eyepax_assignment/screen/sign_up_&_in/sign_in.dart';
import 'package:eyepax_assignment/services/local_storage_service.dart';
import 'package:eyepax_assignment/services/secure_storage_service.dart';
import 'package:eyepax_assignment/widget/custome_dialog_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("https://picsum.photos/200"),
                    fit: BoxFit.cover)),
            child: Container(
              width: double.infinity,
              height: 200,
              child: Container(
                alignment: Alignment(0.0, 2.5),
                child: CircleAvatar(
                  backgroundImage: NetworkImage("https://picsum.photos/200"),
                  radius: 60.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            "User Name",
            style: TextStyle(
                fontSize: 25.0,
                color: Colors.blueGrey,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {
                  openDialogCTX(context,
                      title: 'Are You Sure!',
                      descriptions: 'Are you sure you want to sign out',
                      cancel: "Cancel",
                      confirmButton: "Confirm", onPress: () async {
                    await DBHelper().deleteAllUsers();
                    await save(SharedPreferencesConstant.USER_ID, null);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignInPage()),
                    );
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.pink, AppColors.primaryColor]),
                  ),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 100.0,
                      maxHeight: 40.0,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Sign Out",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
