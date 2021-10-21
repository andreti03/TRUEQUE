import 'package:flutter/material.dart';

class ItemCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(left: 10, top: 5, bottom: 20),
      child: Column(
        children: <Widget>[
          Image.asset(
            "assets/images/Papa_pastusa.png",
            width: 200,
            //height: 200,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              padding: EdgeInsets.only(top: 0, left: 15),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Papa Pastusa\n",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "\$350/u",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
