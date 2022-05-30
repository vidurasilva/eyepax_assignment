import 'package:eyepax_assignment/constant/router_path.dart';
import 'package:eyepax_assignment/models/user_model.dart';
import 'package:eyepax_assignment/services/local_storage_service.dart';
import 'package:eyepax_assignment/services/secure_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:eyepax_assignment/configs/colors.dart';
import 'package:eyepax_assignment/configs/images.dart';
import 'package:eyepax_assignment/screen/sign_up_&_in/sign_in.dart';
import 'package:intl/intl.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool validationFall = false, loader = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                  height: validationFall
                      ? (MediaQuery.of(context).size.height) * 0.03
                      : (MediaQuery.of(context).size.height) * 0.15),
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
                  controller: fullName,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Full Name',
                      hintText: "Enter Your Full Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25.0, right: 25.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: phoneNumber,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mobile/Phone Number',
                      hintText: 'Enter Own Mobile Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    } else if (value.length != 10) {
                      return 'Please enter correct mobile number';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25.0, right: 25.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: email,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
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
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25.0, right: 25.0, top: 15, bottom: 25),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Secure Password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                height: (MediaQuery.of(context).size.height) * 0.07,
                width: (MediaQuery.of(context).size.width) * 0.55,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: MaterialButton(
                  onPressed: () async {
                    print("Sign Up");
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        loader = true;
                      });
                      print(
                          'fullName : ${fullName.text}  <=> password : ${password.text} <=> email : ${email.text}  <=> phoneNumber : ${phoneNumber.text}');
                      String status = await DBHelper().userRegister(UserModel(
                          fullName: fullName.text,
                          password: password.text,
                          email: email.text,
                          mobile: phoneNumber.text,
                          creatDatetime: DateFormat('yyyy-MM-dd HH:mm')
                              .format(DateTime.now())));
                      setState(() {
                        loader = false;
                      });
                      if (status == 'Success') {
                        await save(
                            SharedPreferencesConstant.USER_ID, email.text);
                        Navigator.pushNamed(
                          context,
                          ScreenConstant.toLandingPage,
                        );
                      } else {
                        Fluttertoast.showToast(
                            msg: status,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 4,
                            backgroundColor: Colors.red[900],
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
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
                          'SIGN UP',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                ),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.025,
              ),
              InkWell(
                child: Text('Already Registerd? Sign in'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
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
