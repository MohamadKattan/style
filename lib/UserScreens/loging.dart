import 'package:flutter/material.dart';
import 'package:style/UserScreens/myhomepage.dart';
import 'package:style/tools/app_mathods.dart';
import 'package:style/tools/firebase_mathods.dart';
import 'signUp.dart';
import 'package:style/tools/app_tools.dart';

class GirliesLogin extends StatefulWidget {
  @override
  _GirliesLoginState createState() => _GirliesLoginState();
}

class _GirliesLoginState extends State<GirliesLogin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
        title: Text('Login'),
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
                    btnTxt: 'Login',
                    onbtnclicked: VerifyLoggin),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ));
                  },
                  child: Center(
                      child: Text(
                    'Not registered?Sign up here',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ))),
            ],
          ),
        ],
      ),
    );
  }

// ignore: non_constant_identifier_names
  VerifyLoggin() async {
    if (email.text == ""

     ) {
      showSnackBar('Error Check your email', scaffoldKey);
      return;
    }
    if (password.text == "") {
      showSnackBar('Error Check your password', scaffoldKey);
      return;
    }
    displayProgressDailog(context);
   bool response =
        await appMathod.logginUser(email: email.text.toLowerCase(), password: password.text.toLowerCase());
    if (response == true) {
      closeProgressDailog(context);
      Navigator.of(context).pop(true);
    } else {
      closeProgressDailog(context);
      showSnackBar('Error Check your information', scaffoldKey);
    }
  }
}
