import 'package:flutter/material.dart';
import 'package:style/UserScreens/myhomepage.dart';
import 'package:style/tools/app_data.dart';
import 'package:style/tools/app_mathods.dart';
import 'package:style/tools/app_tools.dart';
import 'package:style/tools/firebase_mathods.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // ignore: non_constant_identifier_names
  TextEditingController fullName = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController RePassword = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  BuildContext context;
  AppMathods appMathod = FireBaseMathods();
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('SignUp'),
        centerTitle: false,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: appTextField(
                    isPassword: false,
                    sidePadding: 18.0,
                    textHint: 'Full name',
                    textIcon: Icons.person,
                    controller: fullName),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: appTextField(
                  isPassword: false,
                  sidePadding: 18.0,
                  textHint: 'Phone Number',
                  textIcon: Icons.call,
                  textType: TextInputType.number,
                  controller: phoneNumber,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: appTextField(
                    isPassword: false,
                    sidePadding: 18.0,
                    textHint: 'Email address',
                    textIcon: Icons.email,
                    controller: email),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                child: appTextField(
                    isPassword: true,
                    sidePadding: 18.0,
                    textHint: 'PassWord',
                    textIcon: Icons.lock,
                    controller: password),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: appTextField(
                    isPassword: true,
                    sidePadding: 18.0,
                    textHint: 'Re-Password',
                    textIcon: Icons.email,
                    controller: RePassword),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ));
                },
                child: appBottun(
                    btnPadding: 18.0,
                    btnTxt: 'SignUp',
                    onbtnclicked: VerifyDetails),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  VerifyDetails() async {
    if (fullName.text == "") {
      showSnackBar('Error Check your name', scaffoldKey);
      return;
    }
    if (phoneNumber.text == "") {
      showSnackBar('Error Check your Number', scaffoldKey);
      return;
    }
    if (email.text == "") {
      showSnackBar('Error Check your email', scaffoldKey);
      return;
    }
    if (password.text == "") {
      showSnackBar('Error Check your password', scaffoldKey);
      return;
    }
    if (RePassword.text == "") {
      showSnackBar('Error Check your Re-password', scaffoldKey);
      return;
    }
    if (password.text != RePassword.text) {
      showSnackBar('Error Check PasssWord&Re-PassWord', scaffoldKey);
      return;
    }
    displayProgressDailog(context);
    bool response = await appMathod.createUserAccount(
        fullName: fullName.text,
        phone: phoneNumber.text,
        password: password.text.toLowerCase(),
        email: email.text.toLowerCase());
    if (response == true) {
      closeProgressDailog(context);
      Navigator.of(context).pop();
      Navigator.of(context).pop(true);
    } else {
      closeProgressDailog(context);
      showSnackBar('Error Check your information', scaffoldKey);
    }
  }
}
