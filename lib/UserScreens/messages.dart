import 'package:flutter/material.dart';

class GirliesMessages extends StatefulWidget {
  @override
  _GirliesMessagesState createState() => _GirliesMessagesState();
}

class _GirliesMessagesState extends State<GirliesMessages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),centerTitle: false,
      ),body: Center(child: Text('Messages')),
    );
  }
}
