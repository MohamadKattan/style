//Database

import 'package:cloud_firestore/cloud_firestore.dart';

const String usersData = 'usersData';
// collction for add product+image
const String appProducts = 'appProducts';
// for add image

//Database Collection
const String userCollection = 'userCollection';

//Date user details

const String userID = 'userID';
const String acctFullName = 'acctFullName';
const String phoneNumber = 'phoneNumber';
const String userEmail = 'userEmail';
const String userPassWord = 'userPassword';
const String photoUrl = 'photoUrl';
const String loggedIN = 'loggedIN';

//this for data add image and daitels products in storge fire base
const String productTitle = 'productTitle';
const String productPrice = 'productPrice';
const String productDesc = 'productDesc';
const String productCat = 'productCat';
const String productColor = 'productColor';
const String productSize = 'productSize';
const String productImages = 'productImages';

// app data
const String successful = 'successful';

const String error = 'error';
//const String future = 'future';

// this data for local sevvice DropdownButton in add_prodoct
List<String> localColors = [
  'Select a color',
  'All colors',
  'Red',
  'Black',
  'White',
  'Pink',
  'Gray',
  'Yellow',
  'Green',
  'blue',
  'Orange',
  'Brown',
  'others'
];

List<String> localSizes = [
  'Select a size',
  'All sizes',
  'Small',
  'Medium',
  'Large',
  'X large',
  'others'
];

List<String> localCatgeories = [
  'Select a Category',
  'shoes',
  'shirt',
  'T shirt',
  'MakeUp',
  'gallery',
  'bags',
  'Watches',
  'Phone',
  'others'
];
