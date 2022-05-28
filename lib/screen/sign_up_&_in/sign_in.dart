import 'package:eyepax_assignment/constant/router_path.dart';
import 'package:eyepax_assignment/services/api_calling/fetch_news_data.dart';
import 'package:eyepax_assignment/services/local_storage_service.dart';
import 'package:eyepax_assignment/services/secure_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:eyepax_assignment/configs/colors.dart';
import 'package:eyepax_assignment/configs/images.dart';
import 'package:eyepax_assignment/screen/sign_up_&_in/sign_up.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  String? emailORmobileNO, password;
  bool validationFall = false, loader = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: (MediaQuery.of(context).size.height) * 0.15),
              Center(
                child: Container(
                    width: (MediaQuery.of(context).size.width) * 0.75,
                    height: (MediaQuery.of(context).size.height) * 0.25,
                    child: Image(
                      image: AppImages.logo,
                    )),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.025,
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email Address',
                      hintText: 'Enter Valid Email Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return "Please enter a valid email address";
                    }
                    emailORmobileNO = value;
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25.0, right: 25.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    password = value;
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.07,
              ),
              Container(
                height: (MediaQuery.of(context).size.height) * 0.07,
                width: (MediaQuery.of(context).size.width) * 0.55,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: MaterialButton(
                  onPressed: () async {
                    print("Loging");
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        loader = true;
                      });
                      print(
                          'emailORmobileNO : $emailORmobileNO  <=> password : $password');
                      await DBHelper()
                          .userSignIn(emailORmobileNO!, password!)
                          .then((value) async {
                        setState(() {
                          loader = false;
                        });
                        if (value.length > 0) {
                          await save(SharedPreferencesConstant.USER_ID,
                              emailORmobileNO);
                          await DBHelper().setUserEnable(emailORmobileNO!);
                          Navigator.pushNamed(
                            context,
                            ScreenConstant.toLandingPage,
                          );
                        } else {
                          Fluttertoast.showToast(
                              msg: "Username or password incorrect",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 4,
                              backgroundColor: Colors.red[900],
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      });
                    } else {
                      setState(() {
                        validationFall = true;
                      });
                    }
                  },
                  child: loader
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white))
                      : Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                ),
              ),
              SizedBox(
                height: validationFall
                    ? (MediaQuery.of(context).size.height) * 0.165
                    : (MediaQuery.of(context).size.height) * 0.195,
              ),
              InkWell(
                child: Text('New User? Create Account'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
