import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trueque/Controllers/AuthenticationController.dart';
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
  Body({
    Key? key,
  }) : super(key: key);
  final emailController = TextEditingController();
  final passController = TextEditingController();

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
            textController: emailController,
            hintText: 'Email',
            onChanged: (value) {email = value;},
          ),
          RoundedInput(
            textController: passController,
            hintText: 'Contraseña',
            obText: true,
            icon: Icons.lock,
            onChanged: (value) {password = value;},
          ),
          SizedBox(height: size.height * 0.06),
          RoundedButton(
            text: 'Ingresar',
            press: () async {
              dynamic result = await _authController.signInWithEmailAndPassword(email: email, password: password);
              if (result == 'Inicio exitoso.'){
                Get.off(()=>HomePage());
              }
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
                press: () async {
                  var user = await _authController.signInWithGoogle();
                  print(user);
                  if (user != ''){
                    Get.off(()=>HomePage());
                  }
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
                Get.off(() => SingupScreen());
            },
          ),
        ],
      ),
    );
  }
}
