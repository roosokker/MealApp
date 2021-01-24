import 'package:MealApp/Dymmy_Data.dart';
import 'package:MealApp/Tab.dart';
import 'package:MealApp/filters.dart';
import 'package:flutter/material.dart';
import 'Category_meal.dart';
import 'Meal_detail.dart';
import 'meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };
  List<Meal> availableMeal = DUMMY_MEALS;
  List<Meal> favoriteMeal = [];
  void setFilters(Map<String, bool> filters) {
    setState(() {
      _filters = filters;
      availableMeal = DUMMY_MEALS.where((meal) {
        if (_filters["gluten"] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters["lactose"] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters["vegan"] == true && !meal.isVegan) {
          return false;
        }
        if (_filters["vegetarian"] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void togglefav(String mealID) {
    int existingIndex = favoriteMeal.indexWhere((meal) => meal.id == mealID);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealID));
      });
    }
  }

  bool isFavorite(String mealID) {
    return favoriteMeal.any((meal) => meal.id == mealID);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: ThemeData.dark().textTheme.copyWith(
              body1: TextStyle(
                  color: Colors.black54,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
              title: TextStyle(
                  color: Colors.white70,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: TabView.id,
        routes: {
          CategoryMeal.id: (context) =>
              CategoryMeal(availablemeals: availableMeal),
          MealDetail.id: (context) => MealDetail(
                addToFavByID: togglefav,
                isfav: isFavorite,
              ),
          TabView.id: (context) => TabView(
                favoritemeals: favoriteMeal,
              ),
          FilterScreen.id: (context) => FilterScreen(
                filters: _filters,
                saveFilters: setFilters,
              ),
        });
  }
}
