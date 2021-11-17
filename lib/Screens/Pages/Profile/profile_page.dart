import 'package:flutter/material.dart';
import 'package:trueque/Screens/Pages/Profile/Components/body.dart';

class ProfilePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Perfil',
          style: TextStyle(fontSize: 35, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Body(),
    );
  }
}
