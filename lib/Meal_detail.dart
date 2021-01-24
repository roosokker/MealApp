import 'package:MealApp/Dymmy_Data.dart';
import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget {
  static const String id = "/mealdetail";
  final Function addToFavByID;
  final Function isfav;
  MealDetail({this.addToFavByID, this.isfav});
  @override
  Widget build(BuildContext context) {
    final mealarg = ModalRoute.of(context).settings.arguments as String;
    final mealID = mealarg;
    final mealdetail = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);
    return Scaffold(
      appBar: AppBar(
        title: Text("Details", style: Theme.of(context).textTheme.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Image.network(
                  mealdetail.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Ingredients"),
              ),
              Container(
                height: 150,
                width: 300,
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10.0),
                    itemCount: mealdetail.ingredients.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                            color: Colors.green[200],
                            child: Text(mealdetail.ingredients[index])),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Steps"),
              ),
              Container(
                height: 200,
                width: 300,
                color: Colors.white70,
                child: ListView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: mealdetail.steps.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          mealdetail.steps[index],
                          style: Theme.of(context).textTheme.body1,
                        ),
                        leading: CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.green[200],
                          child: Text("# ${index + 1}"),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[200],
        child: Icon(isfav(mealID) ? Icons.star : Icons.star_border),
        onPressed: () {
          addToFavByID(mealID);
        },
      ),
    );
  }
}
