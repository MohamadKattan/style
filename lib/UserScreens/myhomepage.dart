import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:style/UserScreens/delivery.dart';
import 'package:style/tools/app_data.dart';
import 'package:style/tools/app_mathods.dart';
import 'package:style/tools/app_tools.dart';
import 'package:style/tools/firebase_mathods.dart';
import 'package:style/tools/store.dart';
import 'favorities.dart';
import 'messages.dart';
import 'cart.dart';
import 'notifictions.dart';
import 'history.dart';
import 'profile.dart';
import 'delivery.dart';
import 'aboutus.dart';
import 'loging.dart';
import 'package:style/itemdetails.dart';
import 'package:style/adminScreen/admin_home.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BuildContext context;
  String acctName = '';
  String acctEmail = '';
  String acctPhotoUrl = '';
  bool isLoggedIn;
  AppMathods appMathods = FireBaseMathods();
  Firestore firestore = Firestore.instance;
  FirebaseStorage firebaseStorage =FirebaseStorage.instance;



  @override
  // ignore: must_call_super
  void initState() {
    getCurrentUser();
    super.initState();
  }

  // ignore: missing_return
  Future getCurrentUser() async {
    acctName = await getStringDataLocally(key: acctFullName);
    acctEmail = await getStringDataLocally(key: userEmail);
    acctPhotoUrl = await getStringDataLocally(key: photoUrl);
    isLoggedIn = await getBoolDataLocally(key: loggedIN);

    // ignore: unnecessary_statements
    acctName == null ? acctName = 'Guest user' : acctName;
    // ignore: unnecessary_statements
    acctEmail == null ? acctEmail = 'guest user@email.com' : acctEmail;
    setState(() {});
  }

  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      drawer: Drawer(
        elevation: 10.0,
        child: ListView(
          children: <Widget>[
            Flexible(
              child: Column(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text(acctName),
                    accountEmail: Text(acctEmail),
                    currentAccountPicture: CircleAvatar(
                      child: Icon(
                        Icons.person,
                        color: Colors.orange,
                      ),
                      radius: 20,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GirliesNotifictions(),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Colors.orange,
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                    title: Text('Order Nonfiction'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GirliesHistory(),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Colors.orange,
                      child: Icon(
                        Icons.history,
                        color: Colors.white,
                      ),
                    ),
                    title: Text('Order History'),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GirliesProfile(),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Colors.orange,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    title: Text('Profile Sitting'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GirliesDelivery(),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Colors.orange,
                      child: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                    ),
                    title: Text('Delivery Adders'),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GirliesAboutus(),
                        ),
                      );
                    },
                    trailing: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.orange,
                      child: Icon(
                        Icons.help,
                        color: Colors.white,
                      ),
                    ),
                    title: Text('About us'),
                  ),
                  ListTile(
                      trailing: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.orange,
                        child: Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(isLoggedIn == true ? 'Logout' : 'Login'),
                      onTap: () {
                        checkIfLoggedIN();
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
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
        title: Center(
          child: GestureDetector(
            onLongPress: openAdmin,
            child: Text('girlies'),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GirliesFavorties(),
                ),
              );
            },
          ),
          Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GirliesMessages(),
                    ),
                  );
                },
              ),
              CircleAvatar(
                backgroundColor: Colors.red,
                radius: 8.0,
                child: Text(
                  '0',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection(appProducts).snapshots(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor)));
          } else {
            final int dataCount = snapshot.data.documents.length;
            print('data count $dataCount');
            if (dataCount == 0) {
              return noDateFound();
            } else {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: dataCount,
                itemBuilder: (context, index) {
                  final DocumentSnapshot document =
                      snapshot.data.documents[index];
                  return buildProducts(context, index, document);
                },
              );
            }
          }
        },
      ),
//      Column(
//        children: <Widget>[
//          Flexible(
//            child:
//          ),
//        ],
//      ),
    );
  }

  checkIfLoggedIN() async {
    if (isLoggedIn == false) {
      bool response = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GirliesLogin(),
        ),
      );
      if (response == true) getCurrentUser();
      return;
    }
    bool response = await appMathods.logOutUser();
    if (response == true) getCurrentUser();
  }

  openAdmin() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AdminHome()));
  }

  Widget noDateFound() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.find_in_page,
              color: Colors.black45,
              size: 80.0,
            ),
            Text(
              'Not product available yet',
              style: TextStyle(color: Colors.black45, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Please check back later',
              style: TextStyle(color: Colors.black45, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProducts(
      BuildContext context, int index, DocumentSnapshot document) {
    List productImage = document[productImages] as List;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetail(
              iteamName: document[productTitle],
              iteamSubName: document[productCat],
              iteamImage:productImage[0],
              iteamImages:productImage,
              iteamPrice: document[productPrice],
              iteamDescription: document[productDesc],
             iteamRating: storeIteam[index].iteamRating,
            ),
          ),
        );
      },
      child: Card(
        child: Stack(
          alignment: FractionalOffset.topLeft,
          children: <Widget>[
            Stack(
              alignment: FractionalOffset.bottomCenter,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(productImage[0]),
                    ),
                  ),
                ),
                Container(
                  color: Colors.black.withAlpha(100),
                  height: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('${document[productTitle]}.....',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          document[productPrice],
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.yellowAccent,
                      ),
                      Text(
                        '${storeIteam[index].iteamRating}',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  height: 25.0,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(100),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
//                    Favoriteitem favoriteitem =
//                        Provider.of<Favoriteitem>(context,listen: false);
//                    favoriteitem.addProduct(product)
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 25,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
