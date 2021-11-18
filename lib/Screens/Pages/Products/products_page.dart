import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trueque/Controllers/controller.dart';
import 'Components/body.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());
    controller.changeListProducts();
    return Scaffold(
      body: Body(),
    );
  }
}
