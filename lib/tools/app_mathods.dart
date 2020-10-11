import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AppMathods {
  Future<bool> logginUser({String email, String password});

  Future<bool> createUserAccount(
      {String fullName, String phone, String email, String password});

  Future<bool> logOutUser();

  Future<DocumentSnapshot> getUserInfo(String userid);

  //this mathod for add product in storge fire base
  Future<String> addNewProduct({Map newProduct});

// this mathod for add image to storage fire base
  Future<List<String>> uploadProductImage(
      {List<File> imageList, String docID});
// this mathod for update products
  Future<bool> updateProductImages({String docID, List<String> data});
}

