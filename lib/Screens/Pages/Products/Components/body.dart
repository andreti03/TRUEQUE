import 'package:trueque/Screens/Pages/Explore/explore_page.dart';
import 'package:trueque/Screens/Pages/Home/home_page.dart';
import 'package:trueque/Screens/Pages/Products/Components/product.dart';
import 'package:trueque/Controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  final Controller controller = Get.put(Controller());
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
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: GetX<Controller>(
        init: controller,
        builder: (Controller widCtrl) {
          return ListView.builder(
            itemCount: widCtrl.listProducts.length,
            itemBuilder: (context, pos) {
              return Product(
                imagePath: widCtrl.listProducts[pos][1],
                name: widCtrl.listProducts[pos][0],
              );
            },
          );
        },
      ),
    );
  }
}


