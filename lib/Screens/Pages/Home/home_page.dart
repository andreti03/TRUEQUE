import 'package:flutter/material.dart';
import 'package:trueque/Screens/Pages/Discover/discover_page.dart';
import 'package:trueque/Screens/Pages/Explore/explore_page.dart';
import 'package:trueque/Screens/Pages/Products/products_page.dart';
import 'package:trueque/Screens/Pages/Profile/profile_page.dart';

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
    ProductsPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              icon: Icon(Icons.add_circle_outline), label: 'Productos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_sharp), label: 'Perfil')
        ],
        fixedColor: Colors.black,
        backgroundColor: Colors.green[100],
      ),
    );
  }
}
