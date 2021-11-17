import 'package:flutter/material.dart';
import 'package:trueque/Controllers/controller.dart';
import 'package:trueque/constants.dart';

// ignore: unused_import
import 'package:get/get.dart';

class WdNotif extends StatelessWidget {
  final IconData icon;
  final String name;
  final Controller widCtrl;
  final int pos;

  const WdNotif(
      {Key? key,
      required this.icon,
      required this.name,
      required this.widCtrl,
      required this.pos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          color: kPrimaryLigthColor,
        ),
        title: Text(name, style: TextStyle(fontSize: 20)),
        subtitle: Text('MENSAJE PREDETERMINADO'),
        trailing: new GestureDetector(
          child: new Icon(
            Icons.close,
            color: kPrimaryLigthColor,
          ),
          onTap: () {
            widCtrl.deleteNot(pos);
          },
        ),
      ),
    );
  }
}
