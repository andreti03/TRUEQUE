import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var _name = 'Pepito Perez'.obs;
  var _imagePath = 'assets/images/Profile_Image.png'.obs;
  var _listProducts = ['Papa pastusa', 'Uvas'].obs;
  var _notifications = ['Compro papa', 'Compro uvas'].obs;
  var _isLog = false.obs;
  final nameController = TextEditingController();

  String get name => _name.value;
  String get imagePath => _imagePath.value;
  List<String> get listProducts => [..._listProducts];
  List<String> get notifications => [..._notifications];
  bool get isLog => _isLog.value;

  String? validator(String value) {
    if (value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  void usernameChanged(String val) {
    _name.value = val;
    update();
  }

  Future<bool> Function() submitFunction() {
    return () async {
      print('Make database call to create ${_name.value} account');
      await Future.delayed(
          Duration(seconds: 1), () => print('User account created'));
      return true;
    };
  }
}
