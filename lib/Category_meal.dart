import 'package:flutter/material.dart';
import 'Dymmy_Data.dart';
import 'Meal_Item.dart';
import 'meal.dart';

class CategoryMeal extends StatelessWidget {
  static const String id = "/catmeals";
  final List<Meal> availablemeals;
  CategoryMeal({this.availablemeals});

  @override
  Widget build(BuildContext context) {
    final routeargs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryID = routeargs["id"];

    final categorymeal = availablemeals
        .where(
          (meal) => meal.categories.contains(categoryID),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meals",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: ListView.builder(
          itemCount: categorymeal.length,
          itemBuilder: (context, index) {
            return MealItem(
              id: categorymeal[index].id,
              title: categorymeal[index].title,
              imageurl: categorymeal[index].imageUrl,
              duration: categorymeal[index].duration,
              afford: categorymeal[index].affordability,
              complexity: categorymeal[index].complexity,
            );
          }),
    );
  }
}
