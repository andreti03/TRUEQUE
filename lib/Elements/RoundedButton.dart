import 'package:flutter/material.dart';
import 'package:trueque/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  final double pd;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryDarkColor,
    this.textColor = Colors.white,
    this.pd = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: pd),
      width: size.width * 0.6,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            backgroundColor: color,
          ),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
