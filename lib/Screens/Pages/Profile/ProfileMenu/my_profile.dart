import 'package:get/get.dart';
import 'package:trueque/Controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:trueque/Screens/Pages/Profile/Components/auxi.dart';

class MyProfile extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<MyProfile> {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    String fecha =
        "${controller.date.year.toString()}/${controller.date.month.toString().padLeft(2, '0')}/${controller.date.day.toString().padLeft(2, '0')}";
    //Size size = MediaQuery.of(context).size;
    var imageasset = new AssetImage(controller.imagePath);
    var image = new Image(image: imageasset, fit: BoxFit.cover);
    return GetX<Controller>(
      init: controller,
      builder: (Controller widCtrl) {
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
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 32),
            physics: BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 15),
              ProfileWidget(imagePath: image, onClicked: () async {}),
              const SizedBox(height: 30),
              TextFieldWidget(
                label: 'Name',
                text: widCtrl.name,
                onChanged: (name) {},
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                label: 'Surname',
                text: widCtrl.surname,
                onChanged: (surname) {},
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                label: 'ID number',
                text: '${widCtrl.cedula}',
                onChanged: (cedula) {},
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                label: 'E-mail',
                text: widCtrl.email,
                onChanged: (email) {},
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                label: 'Mobile phone',
                text: '${widCtrl.cellphone}',
                onChanged: (cellphone) {},
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                label: 'Date of birth',
                text: fecha,
                onChanged: (date) {},
              ),
            ],
          ),
        );
      },
    );
  }
}
