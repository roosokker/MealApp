import 'package:flutter/material.dart';
import 'Category_meal.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItem({@required this.id, @required this.title, @required this.color});

  void selectedCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMeal.id, arguments: {
      "id": id,
      "title": title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () => selectedCategory(context),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.body1,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
