import 'package:flutter/material.dart';


class ForgPassw extends StatelessWidget {
  final VoidCallback press;
  const ForgPassw({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: press,
          child: Text(
            '¿Olvidaste la contraseña?',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
