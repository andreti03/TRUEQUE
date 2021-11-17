// ignore_for_file: invalid_language_version_override

import 'package:flutter/material.dart';
import 'package:trueque/Controllers/controller.dart';
import 'package:trueque/Screens/Welcome/welcome_screen.dart';
import 'package:trueque/constants.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';


Future<void> main() async{
  // @dart=2.9
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(webRecaptchaSiteKey: 'recaptcha-v3-site-key');
  Get.lazyPut<Controller>(() => Controller());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Controller controller = Get.put(Controller());
  
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
