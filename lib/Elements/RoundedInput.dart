import 'package:flutter/material.dart';

class RoundedInput extends StatelessWidget {
  TextEditingController textController = TextEditingController();
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final bool obText;

  RoundedInput({
    Key? key,
    required this.textController,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    this.obText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextContainer(
      child: TextField(
        obscureText: obText,
        controller: textController,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.black,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class TextContainer extends StatelessWidget {
  final Widget child;
  const TextContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: size.width * 0.6,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(29)),
      child: child,
    );
  }
}
