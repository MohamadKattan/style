import 'package:flutter/material.dart';

class GirliesAboutus extends StatefulWidget {
  @override
  _GirliesAboutusState createState() => _GirliesAboutusState();
}

class _GirliesAboutusState extends State<GirliesAboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),centerTitle: false,
      ),
      body: Center(child: Text(' About Us')),
    );
  }
}
