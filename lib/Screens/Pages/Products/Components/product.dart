import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final String imagePath;
  final String name;

  const Product({Key? key, required this.imagePath, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 100,
            width: 130,
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
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Row(
                  children: <Widget>[
                    TextButton(
                      child: const Text('Volver a comprar'),
                      onPressed: () {
                        print(name);
                      },
                    ),
                    SizedBox(width: 8),
                    TextButton(
                      child: const Text('Buscar Similar'),
                      onPressed: () {
                        print(name);
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
