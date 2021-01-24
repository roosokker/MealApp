import 'package:flutter/material.dart';

import 'Meal_Item.dart';
import 'meal.dart';

class Favorites extends StatelessWidget {
  final List<Meal> favorites;
  Favorites({this.favorites});
  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty) {
      return Center(
        child: Text(''' 
    You have no favorites yet!!
    Start adding your favorite recipes...
    '''),
      );
    } else {
      return ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            return MealItem(
              id: favorites[index].id,
              title: favorites[index].title,
              imageurl: favorites[index].imageUrl,
              duration: favorites[index].duration,
              afford: favorites[index].affordability,
              complexity: favorites[index].complexity,
            );
          });
    }
  }
}
