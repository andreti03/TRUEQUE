import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class ExplorePage extends StatelessWidget {
  get controller => null;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Expanded(
          child: FloatingSearchBar(
        controller: controller,
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.white,
              elevation: 4.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: Colors.accents.map((color) {
                  return Container(height: 112, color: color);
                }).toList(),
              ),
            ),
          );
        },
      )),
      Container(
        padding: EdgeInsets.only(left: 0, top: 20),
        child: Text(
          'Cerca de ti',
          style: TextStyle(fontSize: 30),
        ),
      ),
      Expanded(
          child: SizedBox(
        height: 10,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, index) => Text('Item $index'),
          itemCount: 10,
        ),
      )),
      Container(
        padding: EdgeInsets.only(left: 40, top: 20),
        child: Text(
          'Frutas y Verduras',
          style: TextStyle(fontSize: 30),
        ),
      ),
      Expanded(
          child: SizedBox(
        height: 10,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, index) => Text('Item $index'),
          itemCount: 10,
        ),
      )),
    ]));
  }
}
