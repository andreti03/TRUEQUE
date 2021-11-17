import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trueque/Controllers/AuthenticationController.dart';
import 'package:trueque/Elements/AlrHavAcc.dart';
import 'package:trueque/Elements/RoundedButton.dart';
import 'package:trueque/Elements/RoundedInput.dart';
import 'package:trueque/Elements/SocialIcon.dart';
import 'package:trueque/Screens/Login/login_screen.dart';
import 'package:trueque/Screens/Singup/Components/background.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final AuthenticationController _authController = AuthenticationController();
    String email = '';
    String password = '';
    String name = '';
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
          SizedBox(height: size.height * 0.05),
          RoundedInput(
            textController: nameController,
            hintText: 'Nombre Completo',
            onChanged: (value) {name = value;},
          ),
          RoundedInput(
            textController: emailController,
            hintText: 'Email',
            onChanged: (value) {email = value;},
            icon: Icons.email,
          ),
          // Obx(()=>Text(_authController.error, style: TextStyle(
          //     fontSize: 10.0,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.red,)
          //   ),),
          RoundedInput(
            textController: passController,
            hintText: 'Contraseña',
            obText: true,
            icon: Icons.lock,
            onChanged: (value) {password = value;},
          ),
          SizedBox(height: size.height * 0.04),
          RoundedButton(
            text: 'Registrar',
            press: () async {
              dynamic result = await _authController.signUpWithEmailAndPassword(email: email, password: password, name:name);
              // print(result);
              },
            pd: 10,
          ),
          SizedBox(height: size.height * 0.19),
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
              Get.off(() => LoginScreen());
            },
            login: false,
          )
        ],
      ),
    );
  }
}
