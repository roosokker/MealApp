import 'package:MealApp/drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const String id = "/filters";
  final Function saveFilters;
  final Map<String, bool> filters;
  FilterScreen({this.saveFilters, this.filters});
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  @override
  void initState() {
    isGlutenFree = widget.filters["gluten"];
    isLactoseFree = widget.filters["lactose"];
    isVegan = widget.filters["vegan"];
    isVegetarian = widget.filters["vegetarian"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerView(),
      appBar: AppBar(
        title: Text(
          "Filters",
          style: Theme.of(context).textTheme.body1,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedfilter = {
                  "gluten": isGlutenFree,
                  "lactose": isLactoseFree,
                  "vegan": isVegan,
                  "vegetarian": isVegetarian,
                };
                widget.saveFilters(selectedfilter);
              })
        ],
        backgroundColor: Colors.green[200],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Text(
                  "Adjust Your Meal Selection",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SwitchReuse(
                "Gluten-Free", "Only includes gluten-free meals", isGlutenFree,
                (val) {
              setState(() {
                isGlutenFree = val;
              });
            }),
            SwitchReuse("Lactose-Free", "Only includes Lactose-free meals",
                isLactoseFree, (val) {
              setState(() {
                isLactoseFree = val;
              });
            }),
            SwitchReuse("Vegan", "Only includes Vegan meals", isVegan, (val) {
              setState(() {
                isVegan = val;
              });
            }),
            SwitchReuse(
                "Vegetarian", "Only includes Vegetarian meals", isVegetarian,
                (val) {
              setState(() {
                isVegetarian = val;
              });
            }),
          ],
        ),
      ),
    );
  }

  Padding SwitchReuse(String title, String subtitle, bool val, Function ontap) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SwitchListTile(
        activeColor: Colors.green[200],
        activeTrackColor: Colors.green[200],
        title: Text(
          title,
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        value: val,
        onChanged: ontap,
      ),
    );
  }
}
