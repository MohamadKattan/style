import 'package:flutter/material.dart';



class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('OrderHistory'),centerTitle: false,
      ),
      body: Center(child: Text('OrderHistory')),
    );
  }
}