import 'package:get/get.dart';
import 'package:trueque/Controllers/controller.dart';

import 'item_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryGroupWidget extends StatelessWidget {
  CategoryGroupWidget(
      {Key? key, required this.title, required this.functionViewMore})
      : super(key: key);

  final String title;
  final Function()? functionViewMore;
  Controller controller = Get.put(Controller());
 
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
              Container(
                width: 500,
                height: 300,
                child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.listProducts.length,
                itemBuilder: (context, idx) {
                  print(controller.listProducts);
                  return ItemCardWidget(
                      productName: controller.listProducts[idx][0],
                      productCost: controller.listProducts[idx][2],
                      imagePath: controller.listProducts[idx][1],
                    );
                },
            ),
              )
              
            ],
          ),
        )
      ],
    ));
  }
}
