import 'package:flutter/material.dart';
import 'body.dart';
import 'package:profile/user/user_data.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

final New_user = User(
  name: 'Carlos Sebastian',
  surname: 'Martinez Vidal',
  ID_number: 1006108401,
  email: 'sebastianmartinezvidal@gmail.com',
  cellphone: 3016264162,
  date: DateTime(2000, 05, 26),
  gender: true,
  image: 'assets/image.jpg',
);

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    String fecha =
        "${New_user.date.year.toString()}/${New_user.date.month.toString().padLeft(2, '0')}/${New_user.date.day.toString().padLeft(2, '0')}";
    Size size = MediaQuery.of(context).size;
    var imageasset = new AssetImage(New_user.image);
    var image = new Image(image: imageasset, fit: BoxFit.cover);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0.10 * size.height,
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.grey[300],
        title: Text(
          "My profile",
          style: TextStyle(
            fontSize: 23.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
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
            text: New_user.name,
            onChanged: (name) {},
          ),
          const SizedBox(height: 20),
          TextFieldWidget(
            label: 'Surname',
            text: New_user.surname,
            onChanged: (surname) {},
          ),
          const SizedBox(height: 20),
          TextFieldWidget(
            label: 'ID number',
            text: '${New_user.ID_number}',
            onChanged: (ID_number) {},
          ),
          const SizedBox(height: 20),
          TextFieldWidget(
            label: 'E-mail',
            text: New_user.email,
            onChanged: (email) {},
          ),
          const SizedBox(height: 20),
          TextFieldWidget(
            label: 'Mobile phone',
            text: '${New_user.cellphone}',
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
  }
}
