import 'package:flutter/material.dart';
import 'package:mealsapp/screens/meal_deatils.dart';
import 'package:mealsapp/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key, required this.meals, this.titel, required this.onTogelfav});

  final String? titel;
  final List<Meal> meals;
  final void Function(Meal meal) onTogelfav;

  void selectmeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailsScreen(
          meal: meal,
          onTogelfav: onTogelfav,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => MealItem(
        meal: meals[index],
        onSelectmeal: (meal) {
          selectmeal(context, meal);
        },
      ),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            'Uh oh... nothing here',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting defrient cateogry',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ]),
      );
    }
    if (titel == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(titel!),
      ),
      body: content,
    );
  }
}
