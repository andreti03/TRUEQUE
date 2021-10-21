import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: TextField(
                    onChanged: (value) {},
                    textAlign: TextAlign.left,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ))),
          Container(
            height: 30,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: [
                  Colors.lightGreen.shade700,
                  Colors.lightGreenAccent
                ])),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
