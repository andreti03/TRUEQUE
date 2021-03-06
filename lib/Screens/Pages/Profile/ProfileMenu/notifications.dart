import 'package:trueque/Controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trueque/Screens/Pages/Explore/Widgets/shopping_page.dart';
import 'package:trueque/Screens/Pages/Profile/Components/notification.dart';
// ignore: unused_import
import 'package:trueque/constants.dart';

class Notifications extends StatelessWidget {
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
          if (widCtrl.notifications.length != 0) {
            return ListView.builder(
              itemCount: widCtrl.notifications.length,
              itemBuilder: (context, pos) {
                return WdNotif(
                  icon: Icons.notifications,
                  name: widCtrl.notifications[pos],
                  widCtrl: widCtrl,
                  pos: pos,
                );
              },
            );
          } else {
            return Center(
                child: Text(
              'No hay notificaciones',
              style: TextStyle(fontSize: 30),
            ));
          }
        },
      ),
    );
  }
}
