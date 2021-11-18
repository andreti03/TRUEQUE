import 'package:flutter/material.dart';
import 'package:trueque/constants.dart';

class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget(
      {Key? key,
      required this.productName,
      required this.productCost,
      required this.imagePath})
      : super(key: key);

  final String productName;
  final String productCost;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
      width: 200,
      margin: EdgeInsets.only(left: 10, top: 5, bottom: 20),
      child: Column(
        children: <Widget>[
          Container(
            width: 200,
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: NetworkImage(imagePath)),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('prueba tap');
            },
            child: Container(
              height: 50,
              padding: EdgeInsets.only(top: 0, left: 15),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$productName\n",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "\$$productCost/u",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class ItemDetails extends StatelessWidget {
  const ItemDetails(
      {Key? key,
      required this.productName,
      required this.productCost,
      required this.imagePath,
      required this.namebutton,
      required this.functionButton})
      : super(key: key);

  final String productName;
  final String productCost;
  final String imagePath;
  final String namebutton;
  final Function()? functionButton;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: kPrimarykColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Container(
              height: size.height * 0.2,
              width: size.height * 0.22,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(imagePath)),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, bottom: 10),
                  child: Text(
                    productName,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    '$productCost/u',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: MaterialButton(
                    onPressed: functionButton,
                    color: kPrimaryDarkColor,
                    elevation: 5,
                    child: Text(
                      namebutton,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
