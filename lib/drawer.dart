import 'package:MealApp/Tab.dart';
import 'package:flutter/material.dart';

import 'filters.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Material(
              elevation: 5.0,
              child: Container(
                // margin: EdgeInsets.fromLTRB(0, 0, 0, 500),
                width: double.infinity,
                height: 200,
                color: Colors.green[200],
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Text("Cooking Up!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Meals",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[800]),
              ),
              leading: Icon(Icons.restaurant, size: 26),
              onTap: () {
                Navigator.pushReplacementNamed(context, TabView.id);
              },
            ),
            ListTile(
              title: Text(
                "Filters",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[800]),
              ),
              leading: Icon(Icons.settings, size: 26),
              onTap: () {
                Navigator.pushReplacementNamed(context, FilterScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
