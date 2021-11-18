import 'package:flutter/material.dart';
import 'package:trueque/Controllers/controller.dart';
import 'package:trueque/Controllers/AuthenticationController.dart';
import 'package:trueque/Screens/Pages/Profile/ProfileMenu/help.dart';
import 'package:trueque/Screens/Pages/Profile/ProfileMenu/my_profile.dart';
import 'package:trueque/Screens/Pages/Profile/ProfileMenu/notifications.dart';
import 'package:trueque/Screens/Pages/Profile/ProfileMenu/settings.dart';
import 'package:trueque/Screens/Welcome/welcome_screen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  final Controller controller = Get.put(Controller());
  final AuthenticationController authController = Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GetX<Controller>(
        init: controller,
        builder: (Controller widCtrl) {
           print(widCtrl.imagePath);
          return Obx(()=> Column(
            children: [
              ProfilePic(imagePath: widCtrl.imagePath),
              SizedBox(height: 20),
              ProfileMenu(
                text: "Ver mi perfil",
                icon: "assets/icons/User Icon.svg",
                press: () {
                  Get.to(() => MyProfile());
                },
              ),
              ProfileMenu(
                text: "Mis Notificaciones",
                icon: "assets/icons/Bell.svg",
                press: () {
                  Get.to(() => Notifications());
                },
              ),
              ProfileMenu(
                text: "Términos y condiciones",
                icon: "assets/icons/Settings.svg",
                press: () {
                  Get.to(() => Settings());
                },
              ),
              ProfileMenu(
                text: "Ayuda",
                icon: "assets/icons/Question mark.svg",
                press: () {
                  Get.to(() => Help());
                },
              ),
              ProfileMenu(
                text: "Cerrar Sesion",
                icon: "assets/icons/Log out.svg",
                press: () async {
                  authController.signOut();
                  Get.to(() => WelcomeScreen());
                },
              ),
            ],
          ));
        },
      ),
    );
  }
}
