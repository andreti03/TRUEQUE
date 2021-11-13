import 'package:flutter/material.dart';
import 'package:trueque/Elements/RoundedButton.dart';
import 'package:trueque/Screens/Login/login_screen.dart';
import 'package:trueque/Screens/Singup/singup_screen.dart';
import 'package:trueque/Screens/Welcome/Components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/pngegg.png',
              fit: BoxFit.fill,
            ),
            Text(
              'TRUEQUE!',
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: 'Ingresar',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
              pd: 10,
            ),
            RoundedButton(
              text: 'Registrarse',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SingupScreen();
                    },
                  ),
                );
              },
              pd: 10,
            ),
          ],
        ),
      ),
    );
  }
}
