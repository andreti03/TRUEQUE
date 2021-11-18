import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trueque/Controllers/controller.dart';
import 'package:trueque/Screens/Pages/Explore/Widgets/item_card.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);

  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    controller.changeListProductsTotal();
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
        body: SingleChildScrollView(
          child: Column(
            children: [ListView.builder(
              shrinkWrap: true,
              itemCount: controller.shoppingList.length,
              itemBuilder: (context, idx) {
                return ItemDetails(
                    productName: controller.shoppingList[idx][0],
                    productCost: controller.shoppingList[idx][2],
                    imagePath: controller.shoppingList[idx][1],
                    namebutton: 'Eliminar',
                    functionButton: () {
                      controller.RemoveShoppingList(idx);
                      Get.back();
                    },
                  );
              },
            )]
            // children: List.generate(controller.shoppingList.length, (idx) {
            //   return Obx(() => ItemDetails(
            //         productName: controller.shoppingList[idx][0],
            //         productCost: controller.shoppingList[idx][2],
            //         imagePath: controller.shoppingList[idx][1],
            //         namebutton: 'Eliminar',
            //         functionButton: () {
            //           controller.RemoveShoppingList(idx);
            //         },
            //       ));
            // }),
          ),
        ));
  }
}
