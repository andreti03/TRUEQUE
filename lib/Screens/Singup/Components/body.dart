import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trueque/Elements/AlrHavAcc.dart';
import 'package:trueque/Elements/RoundedButton.dart';
import 'package:trueque/Elements/RoundedInput.dart';
import 'package:trueque/Screens/Login/login_screen.dart';
import 'package:trueque/Screens/Singup/Components/background.dart';
import 'package:trueque/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
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
              onChanged: (value) {},
            ),
            RoundedInput(
              hintText: 'Contraseña',
              obText: true,
              icon: Icons.lock,
              onChanged: (value) {},
            ),
            SizedBox(height: size.height * 0.06),
            RoundedButton(
              text: 'Registrar',
              press: () {},
              pd: 10,
            ),
            SizedBox(height: size.height * 0.15),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
              login: false,
            )
          ],
        ),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final String asst;
  final VoidCallback press;
  const SocialIcon({
    Key? key,
    required this.asst,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: kPrimaryLigthColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          asst,
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
