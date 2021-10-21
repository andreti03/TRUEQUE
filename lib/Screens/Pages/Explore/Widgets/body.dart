import 'category_group.dart';
import 'package:flutter/material.dart';
import 'package:trueque/Screens/Pages/Explore/Widgets/search_bar.dart';

class Body extends StatelessWidget {
  get controller => null;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      SizedBox(
        height: 20,
      ),
      SearchBarWidget(),
      SizedBox(
        height: 20,
      ),
      CategoryGroupWidget(),
      CategoryGroupWidget(),
      CategoryGroupWidget(),
    ]));
  }
}
