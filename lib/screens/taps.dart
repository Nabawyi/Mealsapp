// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummy_data.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/catogories.dart';
import 'package:mealsapp/screens/filteres.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/widgets/main_drower.dart';

const Kintialfilters = {
  Filter.glutenfree: false,
  Filter.lactosefree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class Tapsscreen extends StatefulWidget {
  const Tapsscreen({super.key});

  @override
  State<Tapsscreen> createState() => _TapsscreenState();
}

class _TapsscreenState extends State<Tapsscreen> {
  int _selectedbageindex = 0;
  final List<Meal> _favmeal = [];
  // ignore: unused_field
  Map<Filter, bool> _selectedfilter = Kintialfilters;

  void _togelfavmeal(Meal meal) {
    final isexesit = _favmeal.contains(meal);

    if (isexesit) {
      _favmeal.remove(meal);
    } else {
      _favmeal.add(meal);
    }
  }

  void _selectbage(int index) {
    setState(() {
      _selectedbageindex = index;
    });
  }

  void _setscreen(String identifir) async {
    Navigator.of(context).pop();
    if (identifir == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => Filtersscreen(
            currentfilter: _selectedfilter,
          ),
        ),
      );
      setState(() {
        _selectedfilter = result ?? Kintialfilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final availablemeals = dummyMeals.where(
      (meal) {
        if (_selectedfilter[Filter.glutenfree]! && !meal.isGlutenFree) {
          return false;
        }
        if (_selectedfilter[Filter.lactosefree]! && !meal.isLactoseFree) {
          return false;
        }
        if (_selectedfilter[Filter.vegan]! && !meal.isVegan) {
          return false;
        }
        if (_selectedfilter[Filter.vegetarian]! && !meal.isVegetarian) {
          return false;
        }
        return true;
      },
    ).toList();
    Widget activscreen = CategoriesScreen(
      availablemeals: availablemeals,
      onTogelfav: _togelfavmeal,
    );
    var activepagetit = 'Categories';

    if (_selectedbageindex == 1) {
      activscreen = MealsScreen(
        meals: const [],
        onTogelfav: _togelfavmeal,
      );
      activepagetit = "Your Favorites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activepagetit),
      ),
      drawer: Maindrawer(onselectedscreen: _setscreen),
      body: activscreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedbageindex,
        onTap: _selectbage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: "Catoegr"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
