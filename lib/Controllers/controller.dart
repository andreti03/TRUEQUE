//import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class Controller extends GetxController {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  var storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  var _name = ''.obs;
  var _cedula = ''.obs;
  var _email = ''.obs;
  var _cellphone = ''.obs;
  var _date = DateFormat('yyyy-MM-dd').obs;
  var _gender= true.obs;
  var _file = File('').obs;
  var _imagePath = ''.obs;
  var _listProducts = [
    [
      'Papa pastusa',
      'assets/images/papa.png',
      350,
      LatLng(4.6017065, -74.0719056)
    ],
    [
      'Maracuya',
      'assets/images/maracuya.png',
      450,
      LatLng(4.6048805, -74.0751683)
    ]
  ].obs;
  var _notifications = [
    'Compro Papa',
    'Compro uvas',
    'Compro Papa',
    'Compro uvas',
    'Compro Papa',
    'Compro uvas',
    'Compro Papa',
    'Compro uvas'
  ].obs;
  var _isLog = false.obs;

  String get name => _name.value;
  String get imagePath => _imagePath.value;
  List<List> get listProducts => [..._listProducts];
  List<String> get notifications => [..._notifications];
  bool get isLog => _isLog.value;
  String get cedula => _cedula.value;
  String get email => _email.value;
  String get cellphone => _cellphone.value;
  DateFormat get date => _date.value;
  bool get gender => _gender.value;
  File get file => _file.value;

  String? validator(String value) {
    if (value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  void handleChooseImageFromGallery() async {
  try{
    XFile? newFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    _file.value = File(newFile!.path);
    var uid = _auth.currentUser?.uid;
    var uploadTask = await storage
                      .ref("Profile/$uid")
                      .putFile(_file.value);
    var dowurl = await uploadTask.ref.getDownloadURL();
    _imagePath.value = dowurl.toString();   
    await users.doc(_auth.currentUser!.uid).set(
        {'image_path': _imagePath.value},
        SetOptions(merge: true)).then((_){
        print("success!");}
      );

  }catch(e){
    print('Error');
  }
  }

  Future<void> updateInformationRegister() async {
    var doc = await users.doc(_auth.currentUser!.uid).get();
    if (doc.exists){
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      _name.value = data?['name'];
      _cedula.value = data?['id_number'];
      _cellphone.value = data?['phone'];
      _email.value = data?['email'];
      _imagePath.value = data?['image_path'];
    }
  }

  void idNumberChanged(String val) {
    var doc = users.doc(_auth.currentUser!.uid);
    _cedula.value = val;
    doc.update({
      'id_number': _cedula.value
    });
    update();
    print('New name: $_cedula');
  }

  void usernameChanged(String val) {
    var doc = users.doc(_auth.currentUser!.uid);
    _name.value = val;
    doc.update({
      'name': _name.value
    });
    update();
    print('New name: $_name');
  }

  void imgProfileChanged(String val) {
    var doc = users.doc(_auth.currentUser!.uid);
    _imagePath.value = val;
    doc.update({
      'image_path': _imagePath.value
    });
    // _imagePath.value = 'assets/images/' + val + '.png';
    update();
    print('New Image: $_imagePath');
  }

  Future<bool> Function() submitFunction() {
    return () async {
      print('Make database call to create ${_name.value} account');
      await Future.delayed(
          Duration(seconds: 1), () => print('User account created'));
      return true;
    };
  }

  void deleteNot(int val) {
    _notifications.removeAt(val);
    update();
    print('New name: $val y $_notifications');
  }
}
