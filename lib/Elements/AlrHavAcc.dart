import 'package:flutter/material.dart';
import 'package:trueque/constants.dart';

class AlrHavAcc extends StatelessWidget {
  final bool login;
  final VoidCallback press;

  const AlrHavAcc({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? '¿No tienes una cuenta?' : '¿Ya tienes una cuenta?',
          style: TextStyle(color: Colors.grey)
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? '  Registrate' : '  Ingresa',
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
