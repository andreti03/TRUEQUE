import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class Controller extends GetxController {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  CollectionReference products =
      FirebaseFirestore.instance.collection('Products');
  CollectionReference productsTotal =
      FirebaseFirestore.instance.collection('ProductsTotal');
  var storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Location _locationService = Location();

  var _name = ''.obs;
  var _cedula = ''.obs;
  var _email = ''.obs;
  var _cellphone = ''.obs;
  var _listProducts = [].obs;
  var _listProductsTotal = [].obs;
  var _gender = ''.obs;
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
  var _shoppingList = [].obs;
  var _isLog = false.obs;

  String get name => _name.value;
  String get imagePath => _imagePath.value;
  Map<String, List> get mapProducts => {..._mapProducts};
  List<List> get listProducts => [..._listProducts];
  List<List> get listProductsTotal => [..._listProductsTotal];
  List<String> get notifications => [..._notifications];
  List<dynamic> get shoppingList => [..._shoppingList];
  bool get isLog => _isLog.value;
  String get cedula => _cedula.value;
  String get email => _email.value;
  String get cellphone => _cellphone.value;
  String get gender => _gender.value;
  File get file => _file.value;

  void changedGender(String newGender) {
    _gender.value = newGender;
  }

  // ignore: non_constant_identifier_names
  void AddShoppingList(
      String name, String imagePath, String price, LatLng location) {
    _shoppingList.add([name, imagePath, price, location]);
  }

  // ignore: non_constant_identifier_names
  void RemoveShoppingList(
      int idx) {
    _shoppingList.removeAt(idx);
  }

  Future<void> changeListProductsTotal() async {
    _listProductsTotal.value = [];
    var userProducts = await productsTotal.get();
    if (userProducts.docs.isNotEmpty) {
      for (var i in userProducts.docs) {
        mapProducts[i.id] = [
          i['name'],
          i['imagePath'],
          i['price'],
          LatLng(i['lat'], i['lng'])
        ];
        _listProductsTotal.add([
          i['name'],
          i['imagePath'],
          i['price'],
          LatLng(i['lat'], i['lng'])
        ]);
      }
    }
  }

  Future<void> changeListProducts() async {
    _listProducts.value = [];
    var userProducts = await products
        .doc(_auth.currentUser!.uid)
        .collection(_auth.currentUser!.uid)
        .get();
    if (userProducts.docs.isNotEmpty) {
      for (var i in userProducts.docs) {
        Map<String, dynamic>? data = i.data();
        mapProducts[i.id] = [
          data['name'],
          data['imagePath'],
          data['price'],
          LatLng(data['lat'], data['lng'])
        ];
        _listProducts.add([
          data['name'],
          data['imagePath'],
          data['price'],
          LatLng(data['lat'], data['lng'])
        ]);
      }
    }
  }

  Future<void> addProduct(
      String nameProduct, String precio, File image, String code) async {
    var location = await _locationService.getLocation();
    products
        .doc(_auth.currentUser!.uid)
        .collection(_auth.currentUser!.uid)
        .doc(code)
        .set({
      'name': nameProduct,
      'price': precio,
      'imagePath': '',
      'lat': location.latitude,
      'lng': location.longitude
    }, SetOptions(merge: true)).then((_) {
      print("success!");
    });

    productsTotal.doc(code).set({
      'name': nameProduct,
      'price': precio,
      'imagePath': '',
      'lat': location.latitude,
      'lng': location.longitude
    }, SetOptions(merge: true)).then((_) {
      print("success!");
    });

    try {
      var imagePath = File(image.path);
      var uid = _auth.currentUser?.uid;
      var uploadTask =
          await storage.ref("Products/$uid/$code").putFile(imagePath);
      var dowurl = await uploadTask.ref.getDownloadURL();
      await products
          .doc(_auth.currentUser!.uid)
          .collection(_auth.currentUser!.uid)
          .doc(code)
          .set({'imagePath': dowurl.toString()}, SetOptions(merge: true)).then(
              (_) {
        print("success!");
      });

      await productsTotal.doc(code).set(
          {'imagePath': dowurl.toString()}, SetOptions(merge: true)).then((_) {
        print("success!");
      });

      var productsTot = await productsTotal.doc(code).get();
      _listProductsTotal.add([
        productsTot['name'],
        productsTot['imagePath'],
        productsTot['price'],
        LatLng(productsTot['lat'], productsTot['lng'])
      ]);
      changeListProducts();
    } catch (e) {
      print('Error');
    }
  }

  Future<void> productsUser(String name, String price, File image) async {
    String code = createCryptoRandomString();
    var doc = await productsTotal.doc(code).get();
    if (!doc.exists) {
      await addProduct(name, price, image, code);
    } else {
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
    try {
      XFile? newFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      _file.value = File(newFile!.path);
      var uid = _auth.currentUser?.uid;
      var uploadTask = await storage.ref("Profile/$uid").putFile(_file.value);
      var dowurl = await uploadTask.ref.getDownloadURL();
      _imagePath.value = dowurl.toString();
      await users.doc(_auth.currentUser!.uid).set(
          {'image_path': _imagePath.value}, SetOptions(merge: true)).then((_) {
        print("success!");
      });
    } catch (e) {
      print('Error');
    }
  }

  Future<void> updateInformationRegister() async {
    var doc = await users.doc(_auth.currentUser!.uid).get();
    if (doc.exists) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      _name.value = data?['name'];
      _cedula.value = data?['id_number'];
      _cellphone.value = data?['phone'];
      _email.value = data?['email'];
      _imagePath.value = data?['image_path'];
    }
  }

  void updateUser(String newCedula, String newName, String newCellphone) {
    if (newCedula == '') {
      newCedula = _cedula.value;
    }
    if (newName == '') {
      newName = _name.value;
    }
    if (newCellphone == '') {
      newCellphone = _cellphone.value;
    }
    var doc = users.doc(_auth.currentUser!.uid);
    _cedula.value = newCedula;
    _name.value = newName;
    _cellphone.value = newCellphone;
    doc.update({
      'id_number': _cedula.value,
      'gender': _gender.value,
      'name': _name.value,
      'phone': _cellphone.value
    });
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
