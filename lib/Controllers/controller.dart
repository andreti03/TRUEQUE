import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

class Controller extends GetxController {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  CollectionReference products = FirebaseFirestore.instance.collection('Products');
  CollectionReference productsTotal = FirebaseFirestore.instance.collection('ProductsTotal');
  var storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Location _locationService = Location();
  
  var _name = ''.obs;
  var _cedula = ''.obs;
  var _email = ''.obs;
  var _cellphone = ''.obs;
  var _listProducts = [].obs;
  var _listProductsTotal = [].obs;
  var _date = DateFormat('yyyy-MM-dd').obs;
  var _gender= true.obs;
  var _file = File('').obs;
  var _imagePath = ''.obs;
  var _mapProducts = {}.obs;
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
  Map<String, List> get mapProducts => {..._mapProducts};
  List<List> get listProducts => [... _listProducts];
  List<List> get listProductsTotal => [... _listProductsTotal];
  List<String> get notifications => [..._notifications];
  bool get isLog => _isLog.value;
  String get cedula => _cedula.value;
  String get email => _email.value;
  String get cellphone => _cellphone.value;
  DateFormat get date => _date.value;
  bool get gender => _gender.value;
  File get file => _file.value;


  String genderFunction() {
    if (_gender.value == true) {
      return 'male';
    } else {
      return 'female';
    }
  }

  void changedGender(bool newGender){
    _gender.value = newGender;
    print(_gender.value);
  }

  String? validator(String value) {
    if (value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  Future<void> changeListProducts() async {
    _listProducts.value = [];
    var userProducts = await products.doc(_auth.currentUser!.uid).collection(_auth.currentUser!.uid).get();
    if (userProducts.docs.isNotEmpty){
      print('entro');
      for (var i in userProducts.docs){
        Map<String, dynamic>? data = i.data();
        mapProducts[i.id] = [data['name'], data['imagePath'], data['price'], LatLng(data['lat'], data['lng'])];
        _listProducts.add([data['name'], data['imagePath'], data['price'], LatLng(data['lat'], data['lng'])]);
      }  
    }
  }

  Future<void> addProduct(String nameProduct, String precio, File image, String code) async {
    var location = await _locationService.getLocation();
    products.doc(_auth.currentUser!.uid).collection(_auth.currentUser!.uid).doc(code).set(
          {'name': nameProduct,
          'price': precio,
          'imagePath': '',
          'lat': location.latitude,
          'lng': location.longitude},
          SetOptions(merge: true)).then((_){
          print("success!");}
        ); 

    productsTotal.doc(code).set(
          {'name': nameProduct,
          'price': precio,
          'imagePath': '',
          'lat': location.latitude,
          'lng': location.longitude},
          SetOptions(merge: true)).then((_){
          print("success!");}
        ); 

    try{
      var imagePath = File(image.path);
      var uid = _auth.currentUser?.uid;
      var uploadTask = await storage
                        .ref("Products/$uid/$code")
                        .putFile(imagePath);
      var dowurl = await uploadTask.ref.getDownloadURL();   
      await products.doc(_auth.currentUser!.uid).collection(_auth.currentUser!.uid).doc(code).set(
          {'imagePath': dowurl.toString()},
          SetOptions(merge: true)).then((_){
          print("success!");}
        );      

      await productsTotal.doc(code).set(
          {'imagePath': dowurl.toString()},
          SetOptions(merge: true)).then((_){
          print("success!");}
        ); 

      var productsTot = await productsTotal.doc(code).get();
      _listProductsTotal.add([productsTot['name'], productsTot['imagePath'], productsTot['price'], LatLng(productsTot['lat'], productsTot['lng'])]);
      changeListProducts();   
    }catch(e){
      print('Error');
    }

  }
    Future<void> productsUser(String name, String price, File image) async {
    String code = createCryptoRandomString();
    var doc = await productsTotal.doc(code).get();
    if(!doc.exists){
      await addProduct(name, price, image, code);
    } else{
      code = createCryptoRandomString();
      productsUser(name, price, image);
    }
  }

  String createCryptoRandomString([int length = 32]) {
    final Random _random = Random.secure();
      var values = List<int>.generate(length, (i) => _random.nextInt(256));
      return base64Url.encode(values);
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
