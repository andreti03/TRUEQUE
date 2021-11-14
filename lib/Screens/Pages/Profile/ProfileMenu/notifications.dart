import 'package:trueque/Controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                onPressed: () {},
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
          return ListView.builder(
            itemCount: widCtrl.notifications.length,
            itemBuilder: (context, pos) {
              return Notification(
                icon: Icons.notifications,
                name: widCtrl.notifications[pos],
              );
            },
          );
        },
      ),
    );
  }
}

class Notification extends StatelessWidget {
  final IconData icon;
  final String name;

  const Notification({Key? key, required this.icon, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              height: 70,
              width: 100,
              child: Icon(
                icon,
                color: kPrimaryLigthColor,
              )),
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(width: 60),
                TextButton(
                  child: Icon(
                    Icons.close,
                    color: kPrimaryLigthColor,
                  ),
                  onPressed: () {
                    print(name);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
