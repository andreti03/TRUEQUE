import 'item_card.dart';
import 'package:flutter/material.dart';

class CategoryGroupWidget extends StatelessWidget {
  const CategoryGroupWidget(
      {Key? key, required this.title, required this.functionViewMore})
      : super(key: key);

  final String title;
  final Function()? functionViewMore;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Row(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: TextStyle(fontSize: 30),
            ),
          ),
          Spacer(),
          TextButton(
              onPressed: functionViewMore,
              child: Text(
                "Ver mas",
                style: TextStyle(color: Colors.green),
              ))
        ]),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              ItemCardWidget(
                productName: "Papa Pastusa",
                productCost: 350,
                imagePath: "assets/images/Papa_pastusa.png",
              ),
              ItemCardWidget(
                productName: "Papa Pastusa",
                productCost: 350,
                imagePath: "assets/images/Papa_pastusa.png",
              ),
              ItemCardWidget(
                productName: "Papa Pastusa",
                productCost: 350,
                imagePath: "assets/images/Papa_pastusa.png",
              ),
              ItemCardWidget(
                productName: "Papa Pastusa",
                productCost: 350,
                imagePath: "assets/images/Papa_pastusa.png",
              ),
              ItemCardWidget(
                productName: "Papa Pastusa",
                productCost: 350,
                imagePath: "assets/images/Papa_pastusa.png",
              ),
              ItemCardWidget(
                productName: "Papa Pastusa",
                productCost: 350,
                imagePath: "assets/images/Papa_pastusa.png",
              ),
              ItemCardWidget(
                productName: "Papa Pastusa",
                productCost: 350,
                imagePath: "assets/images/Papa_pastusa.png",
              ),
              ItemCardWidget(
                productName: "Papa Pastusa",
                productCost: 350,
                imagePath: "assets/images/Papa_pastusa.png",
              ),
              ItemCardWidget(
                productName: "Papa Pastusa",
                productCost: 350,
                imagePath: "assets/images/Papa_pastusa.png",
              ),
              ItemCardWidget(
                productName: "Papa Pastusa",
                productCost: 350,
                imagePath: "assets/images/Papa_pastusa.png",
              ),
            ],
          ),
        )
      ],
    ));
  }
}
