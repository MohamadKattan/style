import 'package:flutter/material.dart';
import 'logoScreen.dart';


void main() {
  runApp(Style());
}

class Style extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        primaryColor: Colors.orange,
      ),
      home: Logo(),
    );
  }
}
