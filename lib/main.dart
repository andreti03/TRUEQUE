import 'package:flutter/material.dart';
import 'package:trueque/Controllers/controller.dart';
import 'package:trueque/Screens/Welcome/welcome_screen.dart';
import 'package:trueque/constants.dart';
import 'package:get/get.dart';

void main() {
  Get.lazyPut<Controller>(() => Controller());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trueque',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
