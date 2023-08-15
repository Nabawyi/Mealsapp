import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/models/mealsdetails.dart';
import 'package:mealsapp/providers/favorite_provider.dart';
import 'package:mealsapp/providers/filter_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favmeals = ref.watch(favmealsprov);

    final isfave=favmeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded =
                  ref.read(favmealsprov.notifier).toglemealsfavstats(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    wasAdded ? 'Meal added as a favorite' : 'Meal removed',
                  ),
                ),
              );
            },
            icon:  Icon(isfave?
              Icons.star:Icons.star_border ,
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
