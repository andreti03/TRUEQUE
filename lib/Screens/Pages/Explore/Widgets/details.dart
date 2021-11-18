import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trueque/Controllers/controller.dart';
import 'package:trueque/Screens/Pages/Explore/Widgets/item_card.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

final Controller controller = Get.put(Controller());

class _DetailsPageState extends State<DetailsPage> {
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
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(controller.listProductsTotal.length, (idx) {
              return ItemDetails(
                productName: controller.listProductsTotal[idx][0],
                productCost: controller.listProductsTotal[idx][2],
                imagePath: controller.listProductsTotal[idx][1],
                namebutton: 'Añadir',
                functionButton: () {
                  controller.AddShoppingList(
                      controller.listProductsTotal[idx][0],
                      controller.listProductsTotal[idx][1],
                      controller.listProductsTotal[idx][2],
                      controller.listProductsTotal[idx][3]);
                },
              );
            }),
          ),
        ));
  }
}
