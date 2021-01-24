import 'package:MealApp/Category_item.dart';
import 'package:flutter/material.dart';
import 'Dymmy_Data.dart';

class CategoryScreen extends StatelessWidget {
  static const String id = "/catScreen";
  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES
            .map((e) => CategoryItem(id: e.id, title: e.title, color: e.color))
            .toList());
  }
}
