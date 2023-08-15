import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';

class FavmealsNotfir extends StateNotifier<List<Meal>> {
  FavmealsNotfir() : super([]);

  bool toglemealsfavstats(Meal meal) {
    final mealisfav = state.contains(meal);

    if (mealisfav) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favmealsprov = StateNotifierProvider<FavmealsNotfir, List<Meal>>(
  (ref) {
    return FavmealsNotfir();
  },
);
