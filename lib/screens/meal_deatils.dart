import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/models/mealsdetails.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(
      {super.key, required this.meal, required this.onTogelfav});

  final Meal meal;
  final void Function(Meal meal) onTogelfav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onTogelfav(meal);
            },
            icon: const Icon(
              Icons.star,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Image.network(
            meal.imageUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            // ignore: sized_box_for_whitespace
            child: Container(
              height: 300,
              width: 300,
              child: ListView.builder(
                itemBuilder: (context, index) => Mealsdtail(meal: meal),
                itemCount: 1,
              ),
            ),
          ),
          // ignore: sized_box_for_whitespace
        ],
      ),
    );
  }
}
