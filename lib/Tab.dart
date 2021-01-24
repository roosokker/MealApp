import 'package:flutter/material.dart';

import 'Category_Screen.dart';
import 'drawer.dart';
import 'favorites.dart';
import 'meal.dart';

class TabView extends StatefulWidget {
  static const String id = "/tabScreen";
  final List<Meal> favoritemeals;
  TabView({this.favoritemeals});
  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  List<Map<String, Object>> page;
  int selectedpageindex = 0;

  void selectedpage(int index) {
    setState(() {
      selectedpageindex = index;
    });
  }

  @override
  void initState() {
    page = [
      {
        "page": CategoryScreen(),
        "title": "Categories",
      },
      {
        "page": Favorites(favorites: widget.favoritemeals),
        "title": "Favorites",
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: Text(
          page[selectedpageindex]["title"],
          style: Theme.of(context).textTheme.body1,
        ),
      ),
      drawer: DrawerView(),
      body: page[selectedpageindex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectedpage,
        backgroundColor: Colors.green[200],
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.white70,
        currentIndex: selectedpageindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favorites"),
          ),
        ],
      ),
    );
  }
}
