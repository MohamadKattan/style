import 'package:flutter/material.dart';



class AppUsers extends StatefulWidget {
  @override
  _AppUsersState createState() => _AppUsersState();
}

class _AppUsersState extends State<AppUsers> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('AppUsers'),centerTitle: false,
      ),
      body: Center(child: Text(' AppUSERS')),
    );
  }
}