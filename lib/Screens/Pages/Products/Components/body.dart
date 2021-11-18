// ignore: unused_import
import 'package:trueque/Screens/Pages/Explore/explore_page.dart';
// ignore: unused_import
import 'package:trueque/Screens/Pages/Home/home_page.dart';
import 'package:trueque/Controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trueque/Screens/Pages/Products/Components/product.dart';
import 'package:trueque/Screens/Pages/Products/add_product.dart';

import '../../../../constants.dart';

class Body extends StatelessWidget {
  final Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Mis Productos',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        centerTitle: true,
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
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: size.height * 0.275,
              right: 10,
            ),
            child: FloatingActionButton(
              backgroundColor: kPrimaryColor,
              onPressed: () {
                Get.to(() => AddProducts());
              },
              child: Icon(Icons.add_box_outlined),
            ),
          );
        },
      ),
    );
  }
}
