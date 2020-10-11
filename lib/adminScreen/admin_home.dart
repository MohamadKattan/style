import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:style/adminScreen/add_products.dart';
import 'package:style/adminScreen/app_messages.dart';
import 'package:style/adminScreen/app_orders.dart';
import 'package:style/adminScreen/app_users.dart';
import 'package:style/adminScreen/order_history.dart';
import 'package:style/adminScreen/privilages.dart';
import 'app_products.dart';
import 'search_data.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('AppAdmin'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(onTap: (){Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>SearchData()));},
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.search,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Search Data',
                        style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(onTap: (){Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>AppUsers()));},
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'App Users',
                        style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(onTap: (){Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>AppOrders()));},
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.notifications,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'App Orders',
                        style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(onTap: (){Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>AppMessages()));},
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.message,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        ' Messages',
                        style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(onTap: (){Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>AppProducts()));},
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.shop,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'App Products',
                        style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(onTap: (){Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>AddProducts()));},
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Add Products',
                        style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(onTap: (){Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>OrderHistory()));},
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.history,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Order History',
                        style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(onTap: (){Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>Privilages()));},
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Privileges',
                        style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
