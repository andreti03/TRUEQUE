import 'package:flutter/material.dart';

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
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? '  Registrate' : '  Ingresa',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
