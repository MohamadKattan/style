import 'package:flutter/material.dart';

class GirliesNotifictions extends StatefulWidget {
  @override
  _GirliesNotifictionsState createState() => _GirliesNotifictionsState();
}

class _GirliesNotifictionsState extends State<GirliesNotifictions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Notifictions'),centerTitle: false,
      ),
      body: Center(child: Text(' Order Notifictions')),
    );
  }
}
