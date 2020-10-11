import 'package:flutter/material.dart';



class Privilages extends StatefulWidget {
  @override
  _PrivilagesState createState() => _PrivilagesState();
}

class _PrivilagesState extends State<Privilages> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(' Privilages'),centerTitle: false,
      ),
      body: Center(child: Text('  Privilages')),
    );
  }
}