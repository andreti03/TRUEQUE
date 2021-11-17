//import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class Controller extends GetxController {
  var _name = 'Carlos Sebastian'.obs;
  var _surname = 'Martinez Vidal'.obs;
  var _cedula = 1006108401.obs;
  var _email = 'sebastianmartinezvidal@gmail.com'.obs;
  var _cellphone = 3016264162.obs;
  var _date = DateTime(2000, 05, 26).obs;
  var _gender= true.obs;
  var _imagePath = 'assets/images/Profile_Image.png'.obs;
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
  String get surname => _surname.value;
  int get cedula => _cedula.value;
  String get email => _email.value;
  int get cellphone => _cellphone.value;
  DateTime get date => _date.value;
  bool get gender => _gender.value;

  String? validator(String value) {
    if (value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  void usernameChanged(String val) {
    _name.value = val;
    update();
    print('New name: $_name');
  }

  void imgProfileChanged(String val) {
    _imagePath.value = 'assets/images/' + val + '.png';
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
