import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var _name = 'Pepito Perez'.obs;
  var _imagePath = 'assets/images/Profile_Image.png'.obs;
  var _listProducts = [
    ['Papa pastusa', 'assets/images/papa.png'],
    ['Maracuya', 'assets/images/maracuya.png']
  ].obs;
  var _notifications = ['Tengo Hambre', 'Compro uvas'].obs;
  var _isLog = false.obs;
  final nameController = TextEditingController();

  String get name => _name.value;
  String get imagePath => _imagePath.value;
  List<List> get listProducts => [..._listProducts];
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
}
