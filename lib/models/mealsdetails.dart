import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';

class Mealsdtail extends StatelessWidget {
  const Mealsdtail({super.key, required this.meal});

  final Meal meal;
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      child: Column(
        children: [
           Text(
            'ingredients',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.amber),
          ),
          Text(
            meal.ingredients.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Steps',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.amber),
          ),
          Text(
            meal.steps.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
