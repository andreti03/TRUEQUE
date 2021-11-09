import 'package:flutter/material.dart';
import 'package:trueque/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

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