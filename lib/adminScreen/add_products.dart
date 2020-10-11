import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:style/tools/app_data.dart';
import 'package:style/tools/app_mathods.dart';
import 'package:style/tools/app_tools.dart';
import 'package:image_picker/image_picker.dart';
import 'package:style/tools/firebase_mathods.dart';


class AddProducts extends StatefulWidget {
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  File file;
  List<File> imageList;
  List<DropdownMenuItem<String>> dropDownColors;
  String selectedColor;
  List<String> colorList = List();


  List<DropdownMenuItem<String>> dropDownSizes;
  String _selectedSize;
  // ignore: non_constant_identifier_names
  List<String> SizeList = List();

  List<DropdownMenuItem<String>> dropDownCatgeories;
  String _selectedCateorgy;
  List<String> catgeoryList = List();

  TextEditingController productTitleController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productDescController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  // ignore: must_call_super
  void initState() {
    // TODO: implement initState
    colorList = List.from(localColors);
    dropDownColors = buildAndGetDropDownItems(colorList);
    selectedColor = dropDownColors[0].value;

    SizeList = List.from(localSizes);
    dropDownSizes = buildAndGetDropDownItems(SizeList);
    _selectedSize = dropDownSizes[0].value;

    catgeoryList = List.from(localCatgeories);
    dropDownCatgeories = buildAndGetDropDownItems(catgeoryList);
    _selectedCateorgy = dropDownCatgeories[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.orange,
      appBar: AppBar(
        elevation: 8.0,
        title: Text('AddProducts'),
        centerTitle: false,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton.icon(
              color: Colors.green,
              onPressed: () {
               pickImage();
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: Text(
                'Image',
                style: (TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              MultiImagePickerList(
                  imageList: imageList,
                  // ignore: missing_return
                  removeNewImage: (index) {
                    removeImage(index);
                  }),
              SizedBox(
                height: 10,
              ),
              ProductTextField(
                  textTitle: 'Product Title',
                  textHint: 'Enter Product Title ',
                  controller: productTitleController),
              SizedBox(
                height: 10,
              ),
              ProductTextField(
                  textTitle: 'Products price',
                  textHint: 'Enter Products price ',
                  controller: productPriceController),
              SizedBox(
                height: 10,
              ),
              ProductTextField(
                  textTitle: 'Description Title',
                  textHint: 'Enter Product Description',
                  controller: productDescController,
                  maxLines: 4,
                  height: 130),
              SizedBox(
                height: 10,
              ),
              ProductDropDown(
                  textTitle: 'Category',
                  selectedItem: _selectedCateorgy,
                  dropDownItems: dropDownCatgeories,
                  changedDropDownItems: changedDropDowncatgeories),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ProductDropDown(
                      textTitle: 'Color',
                      selectedItem: selectedColor,
                      dropDownItems: dropDownColors,
                      changedDropDownItems: changedDropDownColor),
                  ProductDropDown(
                      textTitle: 'Size',
                      selectedItem: _selectedSize,
                      dropDownItems: dropDownSizes,
                      changedDropDownItems: changedDropDownSizes),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              appBottun(
                btnPadding: 20.0,
                btnTxt: 'Add product',
                onbtnclicked:  addNewProducts,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // for dropbutton من اجل قبول تعديل داخل درب بوتون
  void changedDropDownColor(String selectedSize) {
    setState(() {
      selectedColor = selectedSize;

      print(selectedSize);
    });
  }

// this void for dropbutton for start selected
  void changedDropDownSizes(String selectedSize) {
    setState(() {
      _selectedSize = selectedSize;
      print(selectedSize);
    });
  }

  // this void for dropbutton for start selected
  void changedDropDowncatgeories(String selectedCatgeory) {
    setState(() {
      _selectedCateorgy = selectedCatgeory;
      print(selectedCatgeory);
    });
  }

  //*******this method for get image from gallery**********

  Future pickImage() async {
    // ignore: deprecated_member_use
    var file = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      List<File> imageFile = List();
      imageFile.add(file);
      if (imageList == null) {
        imageList = List.from(imageFile, growable: true);
      } else {
        for (int s = 0; s < imageFile.length; s++) {
          imageList.add(file);
        }
      }
      setState(() {

      });
    }
  }




  // this mathod for delet image
  removeImage(int index) async {
    imageList.removeAt(index);
    setState(() {});
  }

  AppMathods appMathods = FireBaseMathods();

  // +this mathod for foction to appbutton and cheack
  addNewProducts() async{
    if (imageList == null || imageList.isEmpty) {
      // ignore: unnecessary_statements
      showSnackBar(
        'Image cannot be empty',
        scaffoldKey,
      );
      return;
    }
    // ignore: unrelated_type_equality_checks
    if (productTitleController.text == '') {
      showSnackBar('ProductTitle cannot be empty', scaffoldKey);
      return;
    }
    // ignore: unrelated_type_equality_checks
    if (productPriceController.text == '') {
      showSnackBar('ProductPrice cannot be empty', scaffoldKey);
      return;
    }
    // ignore: unrelated_type_equality_checks
    if (productDescController.text == '') {
      showSnackBar('ProductDsec cannot be empty', scaffoldKey);
      return;
    }

    if (_selectedCateorgy == 'Select a Catgeory') {
      showSnackBar('Please Select a Category', scaffoldKey);
      return;
    }

    if (_selectedSize == 'Select a size') {
      showSnackBar('Please Select a size', scaffoldKey);
      return;
    }
    if (selectedColor == 'Select a color') {
      showSnackBar('Please Select a color', scaffoldKey);
      return;
    }

    // show displayprgross dailof
    displayProgressDailog(context);
//this map take daitels from app_data for add product in storge fire base
    Map <String,dynamic>newProduct={
      productTitle:productTitleController.text,
      productPrice:productPriceController.text,
      productDesc:productDescController.text,
      productCat : _selectedCateorgy,
      productColor: selectedColor,
      productSize : _selectedSize,
    };
//    // **************add imformtion to firebase*****************
    String productID=await appMathods.addNewProduct(newProduct:newProduct );

//    //****************** +add image to firebase***************************
   List<String>imagesURL = await appMathods.uploadProductImage(docID: productID,imageList: imageList);


//    //*************+ check if found any error*****************
    if (imagesURL.contains(error)){
      closeProgressDailog(context);
      showSnackBar('image upload error call developer', scaffoldKey);
      return;
    }
    // +this method if upload is right will update and add image and imfo
    bool result = await appMathods.updateProductImages(docID: productID,data: imagesURL);
    if (result!=null&&result==true){
      closeProgressDailog(context);
      resetEveryThing();
      showSnackBar('Product added is don', scaffoldKey);
    }else{
      closeProgressDailog(context);
      showSnackBar('update is error call developer', scaffoldKey);
    }


}

  void resetEveryThing() {
    imageList.clear();
    productDescController.text='';
    productPriceController.text='';
    productTitleController.text='';
    selectedColor='Select a color';
    _selectedSize='Select a size';
    _selectedCateorgy='Select a Category';

  }

}
