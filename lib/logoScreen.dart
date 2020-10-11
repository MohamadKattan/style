import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'UserScreens/myhomepage.dart';
import 'dart:async';

class Logo extends StatefulWidget {
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return MyHomePage();
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.fill,
              image: AssetImage(
                'images/color2.jpg',
              ),
            ),
          ),

        ),
      ),
    );
  }
}
