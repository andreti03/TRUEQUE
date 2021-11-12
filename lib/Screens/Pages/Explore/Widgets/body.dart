import 'category_group.dart';
import 'package:flutter/material.dart';
import 'package:trueque/Screens/Pages/Explore/Widgets/search_bar.dart';

class Body extends StatelessWidget {
  get controller => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Trueque',
          style: TextStyle(fontSize: 35, color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    Colors.lightGreen.shade700,
                    Colors.lightGreenAccent
                  ])),
              child: IconButton(
                padding: EdgeInsets.symmetric(vertical: 0.1),
                icon: const Icon(
                  Icons.shopping_basket_rounded,
                  color: Colors.white,
                ),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        SizedBox(
          height: 20,
        ),
        SearchBarWidget(),
        SizedBox(
          height: 20,
        ),
        CategoryGroupWidget(
          title: 'Cerca de ti',
          functionViewMore: () {},
        ),
        CategoryGroupWidget(
          title: 'Frutas y verduras',
          functionViewMore: () {},
        ),
        CategoryGroupWidget(
          title: 'Varios',
          functionViewMore: () {},
        ),
      ])),
    );
  }
}
