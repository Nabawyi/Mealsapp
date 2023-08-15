// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mealsapp/providers/favorite_provider.dart';
import 'package:mealsapp/screens/catogories.dart';
import 'package:mealsapp/screens/filteres.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/widgets/main_drower.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/providers/filter_provider.dart';

const Kintialfilters = {
  Filter.glutenfree: false,
  Filter.lactosefree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class Tapsscreen extends ConsumerStatefulWidget {
  const Tapsscreen({super.key});

  @override
  ConsumerState<Tapsscreen> createState() => _TapsscreenState();
}

class _TapsscreenState extends ConsumerState<Tapsscreen> {
  int _selectedbageindex = 0;
  // ignore: unused_field

  void _selectbage(int index) {
    setState(() {
      _selectedbageindex = index;
    });
  }

  void _setscreen(String identifir) async {
    Navigator.of(context).pop();
    if (identifir == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const Filtersscreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availablemeals = ref.watch(fillermealsprovider);
    Widget activscreen = CategoriesScreen(
      availablemeals: availablemeals,
    );
    var activepagetit = 'Categories';

    if (_selectedbageindex == 1) {
      final favemeals = ref.watch(favmealsprov);
      activscreen = MealsScreen(
        meals: favemeals,
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
