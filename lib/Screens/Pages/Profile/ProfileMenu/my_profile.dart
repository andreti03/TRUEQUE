import 'package:get/get.dart';
import 'package:trueque/Controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:trueque/Elements/RoundedInput.dart';
import 'package:trueque/Screens/Pages/Profile/Components/auxi.dart';
import 'package:trueque/constants.dart';

class MyProfile extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<MyProfile> {
  final Controller controller = Get.put(Controller());


  @override
  Widget build(BuildContext context) {
    controller.updateInformationRegister();
    var image = Image.network(controller.imagePath, fit: BoxFit.cover,);
    TextEditingController cedula = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController cellphone = TextEditingController();
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
              ProfileWidget(imagePath: image, onClicked: () async {controller.handleChooseImageFromGallery();}),
              const SizedBox(height: 30),
              RoundedInput(
                textController: name,
                hintText: widCtrl.name,
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              RoundedInput(
                icon: Icons.featured_play_list,
                textController: cedula,
                hintText: widCtrl.cedula,
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              RoundedInput(
                icon: Icons.mail,
                textController: email,
                hintText: widCtrl.email,
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              RoundedInput(
                icon: Icons.phone,
                textController: cellphone,
                hintText: widCtrl.cellphone,
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              Text(
            'Género',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
              ),
              Container(
                padding:
                EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
                child: DropdownButton<String>(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  value: widCtrl.gender,
                  items: <String>['','Masculino', 'Femenino', 'No Binario'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {widCtrl.changedGender(value!);},
                ),
              ),
              TextButton(onPressed: () {widCtrl.updateUser(cedula.text, name.text, cellphone.text);
                                        Get.back();
                                  }
              , 
                                  child: Text('Actualizar Información', 
                                          style: TextStyle(color: kPrimaryColor, fontSize: 20),))
            ],
          ),
        );
      },
    );
  }
}
