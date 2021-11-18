import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trueque/Controllers/controller.dart';
import 'package:trueque/Screens/Pages/Explore/Widgets/item_card.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);

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
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
              )),
        ),
        body: Column(
          children: List.generate(controller.listProducts.length, (idx) {
            return Obx(() => ItemDetails(
                  productName: controller.listProducts[idx][0],
                  productCost: controller.listProducts[idx][2],
                  imagePath: controller.listProducts[idx][1],
                  namebutton: 'Eliminar',
                  functionButton: () {
                    controller.RemoveShoppingList(
                        controller.listProducts[idx][0],
                        controller.listProducts[idx][1],
                        controller.listProducts[idx][2],
                        controller.listProducts[idx][3]);
                  },
                ));
          }),
        ));
  }
}
