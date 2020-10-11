import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:style/tools/progressdailog.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget appTextField({
  TextEditingController controller,
  IconData textIcon,
  String textHint,
  bool isPassword,
  double sidePadding,
  TextInputType textType,
}) {
  // ignore: unnecessary_statements
  sidePadding == null ? sidePadding = 0.0 : sidePadding;
  // ignore: unnecessary_statements
  textHint == null ? textHint = '' : textHint;

  return Padding(
    padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword == null ? false : isPassword,
        keyboardType: textType == null ? TextInputType.text : textType,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: textHint,
          prefixIcon: textIcon == null ? Container() : Icon(textIcon),
        ),
      ),
    ),
  );
}

Widget appBottun(
    {String btnTxt, double btnPadding, VoidCallback onbtnclicked}) {
  // ignore: unnecessary_statements
  btnPadding == null ? btnPadding = 0.0 : btnPadding;
  // ignore: unnecessary_statements
  btnTxt == null ? btnTxt == 'AppBottun' : btnTxt;
  return Padding(
    padding: EdgeInsets.all(btnPadding),
    child: RaisedButton(
      onPressed: onbtnclicked,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Center(
          child: Text(
        btnTxt,
        style: TextStyle(color: Colors.orange),
      )),
    ),
  );
}

showSnackBar(String message, final scaffoldKey) {
  scaffoldKey.currentState.showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}

// for circle wait enter
displayProgressDailog(BuildContext context) {
  Navigator.of(context).push(
    PageRouteBuilder(
        opaque: false,
        // ignore: missing_return
        pageBuilder: (BuildContext context, _, __) {
          return ProgressDailog();
        }),
  );
}

// for circle wait back
closeProgressDailog(BuildContext context) {
  Navigator.of(context).pop();
}

// for data
writeDataLocally({String key, String value}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.setString(key, value);
}

//من اجل يوزير انفو في ديتا لوكن
writeBoolDataLocally({String key, bool value}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.setBool(key, value);
}

//من اجل معلومات في دراو
getDataLocally({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.get(key);
}

//من أجل معاومات في دراو اسم ةالإيميل
getStringDataLocally({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.getString(key);
}

getBoolDataLocally({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.getBool(key) == null ? false : localData.getBool(key);
}

//من اجل معاومات دراو عند تسجيل ودخوا
clearDataLocally() async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.clear();
}

//من أجل صفحة أدمن
// ignore: non_constant_identifier_names
Widget ProductTextField({
  String textTitle,
  String textHint,
  TextEditingController controller,
  double height,
  TextInputType textType,
  int maxLines,
}) {
  // ignore: unnecessary_statements
  textHint == null ? textHint = 'Enter hint' : textHint;
  // ignore: unnecessary_statements
  height == null ? height = 50.0 : height;
  // ignore: unnecessary_statements
  textTitle == null ? textTitle = 'Enter title' : textTitle;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          textTitle,
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Container(
          height: height,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          padding: EdgeInsets.only(right: 8.0, left: 8.0),
          child: TextField(
            controller: controller,
            keyboardType: textType == null ? TextInputType.text : textType,
          maxLines: maxLines==null?null:maxLines ,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: textHint,
            ),
          ),
        ),
      ),
    ],
  );
}

//من أجل صفحة الأدمن
// ignore: non_constant_identifier_names
Widget ProductDropDown(
    {String selectedItem,
    List<DropdownMenuItem<String>> dropDownItems,
    ValueChanged<String> changedDropDownItems,
    String textTitle}) {
  // ignore: unnecessary_statements
  textTitle == null ? textTitle = 'Enter title' : textTitle;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          textTitle,
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            dropdownColor: Colors.orange,
            iconEnabledColor: Colors.white,
            iconDisabledColor: Colors.white,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            value: selectedItem,
            items: dropDownItems,
            onChanged: changedDropDownItems,
          ),
        ),
      ),
    ],
  );
}

// this widget tool for image in add_prodact page(شريط عرض صور التي تقةم بأضافتها وحذفها)
// ignore: non_constant_identifier_names
Widget MultiImagePickerList(
    {List<File> imageList, VoidCallback removeNewImage(int position)}) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
    child: imageList == null || imageList.length == 0
        ? Container()
        : SizedBox(
      height: 150,
      child: ListView.builder(
          itemCount: imageList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 3.0, right: 3.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 150.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(100),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(imageList[index])),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: IconButton(
                        onPressed:(){removeNewImage(index);} ,
                        icon: Icon(
                          Icons.clear,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    ),
  );
}

//(وظيفة خاصة في دروب بوتن في صفحة أدمن (add Product
List<DropdownMenuItem<String>> buildAndGetDropDownItems(List size) {
  List<DropdownMenuItem<String>> items = List();
  for (String size in size) {
    items.add(DropdownMenuItem(value: size, child: Text(size)));
  }
  return items;
}


