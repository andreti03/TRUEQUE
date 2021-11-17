import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trueque/Domain/Authentication/sign_in.dart';
import 'package:trueque/Elements/AlrHavAcc.dart';
import 'package:trueque/Elements/RoundedButton.dart';
import 'package:trueque/Elements/RoundedInput.dart';
import 'package:trueque/Elements/SocialIcon.dart';
import 'package:trueque/Screens/Login/login_screen.dart';
import 'package:trueque/Screens/Singup/Components/background.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final AuthenticationController _authController = AuthenticationController();
    String email = '';
    String password = '';
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: size.height * 0.08),
          Text(
            'Registrate',
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: size.height * 0.1),
          RoundedInput(
            hintText: 'Email',
            onChanged: (value) {email = value;},
          ),
          Obx(()=>Text(_authController.error, style: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
              color: Colors.red,)
            ),),
          RoundedInput(
            hintText: 'Contraseña',
            obText: true,
            icon: Icons.lock,
            onChanged: (value) {password = value;},
          ),
          SizedBox(height: size.height * 0.06),
          RoundedButton(
            text: 'Registrar',
            press: () async {
              print(email);
              print(password);
              dynamic result = await _authController.signUpWithEmailAndPassword(email: email, password: password);
              print(result);
              },
            pd: 10,
          ),
          SizedBox(height: size.height * 0.20),
          Text(
            'Continuar con',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: size.height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SocialIcon(
                asst: 'assets/icons/facebook.svg',
                press: () {
                  print('object');
                },
              ),
              SocialIcon(
                asst: 'assets/icons/google.svg',
                press: () {
                  print(size);
                },
              ),
              SocialIcon(
                asst: 'assets/icons/twitter.svg',
                press: () {
                  print('object');
                },
              ),
            ],
          ),
          SizedBox(height: size.height * 0.02),
          AlrHavAcc(
            press: () {
              Get.to(() => LoginScreen());
            },
            login: false,
          )
        ],
      ),
    );
  }
}
