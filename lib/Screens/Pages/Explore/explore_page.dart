import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trueque/Controllers/controller.dart';
import 'Widgets/body.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());
    controller.changeListProductsTotal();
    return Scaffold(
      body: Body(),
    );
  }
}
