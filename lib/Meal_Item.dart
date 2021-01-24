import 'package:MealApp/meal.dart';
import 'package:flutter/material.dart';
import 'Meal_detail.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageurl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability afford;

  MealItem(
      {@required this.id,
      @required this.imageurl,
      @required this.title,
      @required this.duration,
      @required this.complexity,
      @required this.afford});

  String get complexitytxt {
    if (complexity == Complexity.Simple) {
      return "Simple";
    } else if (complexity == Complexity.Challenging) {
      return "Challenging";
    } else if (complexity == Complexity.Hard) {
      return "Hard";
    }
    return "unknown";
  }

  String get affordtxt {
    if (afford == Affordability.Pricey) {
      return "Pricey";
    } else if (afford == Affordability.Affordable) {
      return "Affordable";
    } else if (afford == Affordability.Luxurious) {
      return "Luxurious";
    }
    return "unknown";
  }

  selectedMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetail.id,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectedMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5.0,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageurl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 250,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexitytxt),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordtxt),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
