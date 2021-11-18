import 'package:trueque/Screens/Pages/Explore/Widgets/details.dart';
import 'package:trueque/Screens/Pages/Explore/Widgets/shopping_page.dart';
// ignore: unused_import
import 'package:trueque/Screens/Pages/Explore/explore_page.dart';

import 'category_group.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Trueque',
          style: TextStyle(fontSize: 35, color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    Colors.lightGreen.shade700,
                    Colors.lightGreenAccent
                  ])),
              child: IconButton(
                padding: EdgeInsets.symmetric(vertical: 0.1),
                icon: const Icon(
                  Icons.shopping_basket_rounded,
                  color: Colors.white,
                ),
                color: Colors.white,
                onPressed: () {
                  Get.to(() => ShoppingPage());
                },
              ),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(children: [
        SizedBox(
      height: 20,
        ),
        CategoryGroupWidget(
      title: 'Productos',
      functionViewMore: () {
        Get.to(()=>DetailsPage());
      },
        ),
      ]),
    );
  }
}
