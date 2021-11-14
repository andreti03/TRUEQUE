import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trueque/Controllers/controller.dart';

class MyProfile extends StatelessWidget {
  MyProfile({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final pathController = TextEditingController();
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
      body: GetX<Controller>(
        init: controller,
        builder: (Controller widCtrl) {
          return Center(
            child: Column(
              children: [
                TextField(
                  textAlign: TextAlign.center,
                  controller: nameController,
                  onSubmitted: (value) {
                    if (nameController.text != '') {
                      widCtrl.usernameChanged(nameController.text);
                      nameController.clear();
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Nombre',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (nameController.text != '') {
                      widCtrl.usernameChanged(nameController.text);
                      nameController.clear();
                    }
                  },
                  icon: Icon(Icons.thumb_up_alt_rounded),
                ),
                Text('Nombre: ${widCtrl.name}'),
                TextField(
                  textAlign: TextAlign.center,
                  controller: pathController,
                  onSubmitted: (value) {
                    if (pathController.text != '') {
                      widCtrl.imgProfileChanged(pathController.text);
                      nameController.clear();
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Path: ',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (pathController.text != '') {
                      widCtrl.imgProfileChanged(pathController.text);
                      pathController.clear();
                    }
                  },
                  icon: Icon(Icons.thumb_up_alt_rounded),
                ),
                Text('Path: ${widCtrl.imagePath}'),
              ],
            ),
          );
        },
      ),
    );
  }
  /* 
  Scaffold(
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
    )
  */
}
