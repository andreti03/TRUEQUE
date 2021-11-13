import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trueque/Controllers/controller.dart';

class MyProfile extends StatelessWidget {
  MyProfile({Key? key}) : super(key: key);

  final nameController = TextEditingController();

  void _search(Controller controller, String val) {
    controller.usernameChanged(val);
    print(controller.name);
  }

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());
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
      body: Center(
        child: Column(
          children: [
            TextField(
                textAlign: TextAlign.center,
                controller: nameController,
                onChanged: (nameText) => _search(controller, nameText),
                decoration: InputDecoration(
                  hintText: 'Nombre',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                )),
            Obx(() => Text('Nombre: ${controller.name}'))
          ],
        ),
      ),
    );
  }
}
