import 'package:flutter/material.dart';

import 'Profile/profile_page.dart';
import 'Discover/discover_page.dart';
import 'Explore/explore_page.dart';
import 'Learn/learn_page.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  List<Widget> _pages = [
    ExplorePage(),
    DiscoverPage(),
    LearnPage(),
    ProfilePage()
  ];

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
      body: _pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        currentIndex: _currentPage,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined), label: 'Explorar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined), label: 'Descubrir'),
          BottomNavigationBarItem(
              icon: Icon(Icons.school_outlined), label: 'Aprender'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_sharp), label: 'Perfil')
        ],
        fixedColor: Colors.black,
        backgroundColor: Colors.green[100],
      ),
    );
  }
}
