import 'package:flutter/material.dart';
import 'package:trueque/constants.dart';

class Product extends StatelessWidget {
  final String imagePath;
  final String name;

  const Product({Key? key, required this.imagePath, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: size.height * 0.13,
            width: size.width * 0.33,
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(imagePath),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: size.height * 0.01),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Row(
                  children: <Widget>[
                    TextButton(
                      child: const Text(
                        'Actualizar',
                        style: TextStyle(color: kPrimaryLigthColor),
                      ),
                      onPressed: () {
                        print(size.height);
                      },
                    ),
                    SizedBox(width: size.height * 0.01),
                    TextButton(
                      child: const Text(
                        'Buscar Similar',
                        style: TextStyle(color: kPrimaryLigthColor),
                      ),
                      onPressed: () {
                        print(size.width);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
