import 'item_card.dart';
import 'package:flutter/material.dart';

class CategoryGroupWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Row(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Cerca de ti',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Spacer(),
          TextButton(
              onPressed: () {},
              child: Text(
                "Ver mas",
                style: TextStyle(color: Colors.green),
              ))
        ]),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              ItemCardWidget(),
              ItemCardWidget(),
              ItemCardWidget(),
              ItemCardWidget(),
              ItemCardWidget(),
              ItemCardWidget(),
              ItemCardWidget(),
              ItemCardWidget(),
              ItemCardWidget(),
              ItemCardWidget(),
            ],
          ),
        )
      ],
    ));
  }
}
