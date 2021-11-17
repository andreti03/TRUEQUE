import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trueque/Domain/Authentication/sign_in.dart';
import 'package:trueque/Elements/AlrHavAcc.dart';
import 'package:trueque/Elements/RoundedButton.dart';
import 'package:trueque/Elements/RoundedInput.dart';
import 'package:trueque/Elements/SocialIcon.dart';
import 'package:trueque/Screens/Login/Components/ForgPassw.dart';
import 'package:trueque/Screens/Login/Components/background.dart';
import 'package:trueque/Screens/Pages/Home/home_page.dart';
import 'package:trueque/Screens/Singup/singup_screen.dart';
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
          SizedBox(height: size.height * 0.06),
          Text(
            'Iniciar sesión',
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
          RoundedInput(
            hintText: 'Contraseña',
            obText: true,
            icon: Icons.lock,
            onChanged: (value) {password = value;},
          ),
          SizedBox(height: size.height * 0.06),
          RoundedButton(
            text: 'Ingresar',
            press: () async {
              print(email);
              print(password);
              dynamic result = await _authController.signInWithEmailAndPassword(email: email, password: password);
              print(result);
              },
            pd: 10,
          ),
          ForgPassw(
            press: () {
              print('Hola');
            },
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
                  // signInWithFacebook();
                  print('object');
                },
              ),
              SocialIcon(
                asst: 'assets/icons/google.svg',
                press: () {
                  _authController.signInWithGoogle();
                  print('object');
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
                Get.to(() => SingupScreen());
            },
          ),
        ],
      ),
    );
  }
}
