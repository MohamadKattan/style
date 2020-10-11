import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:style/tools/app_data.dart';
import 'package:style/tools/app_mathods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:style/tools/app_tools.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'app_data.dart';



class FireBaseMathods implements AppMathods {
  Firestore firestore = Firestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseStorage fs = FirebaseStorage.instance;
//  dynamic future;

  @override
  // ignore: missing_return
  Future<bool> createUserAccount(
      {String fullName, String phone, String email, String password}) async {
    // TODO: implement createUserAccount
//    throw UnimplementedError();
    AuthResult user;

    try {
      user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        await firestore.collection(usersData).document(userID).setData({
          userID: userID,
          acctFullName: fullName,
          phoneNumber: phone,
          userEmail: email,
          userPassWord: password
        });
        writeDataLocally(key: userID, value: userID);
        writeDataLocally(key: fullName, value: fullName);
        writeDataLocally(key: userEmail, value: email);
        writeDataLocally(key: userPassWord, value: password);
      }
    } on PlatformException catch (e) {
      print(e.details);
      return notComplete();
    }

    return user == null ? notComplete() : complete();
  }

  @override
  // ignore: missing_return
  Future<bool> logginUser({String email, String password}) async {
    // TODO: implement logginUser
//    throw UnimplementedError();

    AuthResult user;
    try {
      user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        DocumentSnapshot userInfo = await getUserInfo(userID);
        writeDataLocally(key: userID, value: userInfo[userID]);
        writeDataLocally(key: acctFullName, value: userInfo[acctFullName]);
        writeDataLocally(key: userEmail, value: userInfo[userEmail]);
        writeDataLocally(key: photoUrl, value: userInfo[photoUrl]);
        writeDataLocally(key: phoneNumber, value: userInfo[phoneNumber]);
        writeBoolDataLocally(key: loggedIN, value: true);
      }
    } on PlatformException catch (e) {
      print(e.details);
      return notComplete();
    }

    return user == null ? notComplete() : complete();
  }

  Future<bool> complete() async {
    return true;
  }

  Future<bool> notComplete() async {
    return false;
  }

  @override
  Future<bool> logOutUser() async {
    // TODO: implement logOutUser
    await auth.signOut();
    await clearDataLocally();
    return complete();
  }

  // ignore: missing_return
  Future<String> successFulMSG() async {
    return successful;
  }

  Future<String> errorMsg(String e) async {
    return e;
  }

  @override
  Future<DocumentSnapshot> getUserInfo(String userid) async {
    // TODO: implement getUserInfo
    return await firestore.collection(usersData).document(userid).get();
  }

  @override
  //it is came from app_mathod for add product to storge and it is took information from data_app
  // ignore: non_constant_identifier_names
  Future<String> addNewProduct({Map newProduct}) async {
  String documentID;
  await firestore
      .collection(appProducts)
      .add(newProduct)
      .then((documentRef) => documentID = documentRef.documentID);
  return documentID;
// TODO: implement addPRoduct


}

// this mathod came from app_mathod for add image to storage
  @override
  // ignore: missing_return
   Future<List<String>> uploadProductImage({
    List<File> imageList,
    String docID,
  }) async {
    // TODO: implement uploadProductImage
    List<String> imagesUrl = List();
//   String imageUrl;


    try {
      for (int s = 0; s < imageList.length; s++) {


        StorageReference storageReference = FirebaseStorage.instance.ref()
            .child(appProducts)
            .child(docID)
            .child(docID + '$s.jpg');



        StorageUploadTask uploadTask = storageReference.putFile((imageList[s]));
        StorageTaskSnapshot taskSnapshot= await uploadTask.onComplete;
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();

        imagesUrl.add(downloadUrl.toString());




      }
    } on PlatformException catch (e) {
      imagesUrl.add(error);
      print(e.details);
    }
    return imagesUrl;
  }

  @override
  Future<bool> updateProductImages({String docID, List<String> data}) async {
    // TODO: implement updateProductImage
    bool msg;
    await firestore
        .collection(appProducts)
        .document(docID)
        .updateData({productImages: data}).whenComplete(() => msg = true);
    return msg;
  }
}
