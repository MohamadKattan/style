import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'cart.dart';

class GirliesFavorties extends StatefulWidget {
  @override
  _GirliesFavortiesState createState() => _GirliesFavortiesState();
}

class _GirliesFavortiesState extends State<GirliesFavorties> {
  Firestore firestore = Firestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GirliesCart(),
                ),
              );
            },
            backgroundColor: Colors.orange,
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
          CircleAvatar(
            radius: 8.0,
            backgroundColor: Colors.red,
            child: Text(
              '0',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My favorite'),
        centerTitle: false,
      ),
      body: null,
    );
  }
}
