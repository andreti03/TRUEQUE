import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trueque/Elements/RoundedButton.dart';
import 'package:trueque/Elements/RoundedInput.dart';
import 'package:trueque/Screens/Login/Components/ForgPassw.dart';
import 'package:trueque/Screens/Login/Components/background.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: size.height * 0.1),
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
            text: 'Ingresar',
            press: () {},
            pd: 10,
          ),
          ForgPassw(
            press: () {
              print('Hola');
            },
          ),
          SizedBox(height: size.height * 0.15),
          Text(
            'Continuar con',
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
