import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/providers/meals_provider.dart';

enum Filter {
  glutenfree,
  lactosefree,
  vegetarian,
  vegan,
}

class Filtersnotfir extends StateNotifier<Map<Filter, bool>> {
  Filtersnotfir()
      : super({
          Filter.glutenfree: false,
          Filter.lactosefree: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
        });
  void setfilters(Map<Filter, bool> chosenfilter) {
    state = chosenfilter;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersprovider = StateNotifierProvider<Filtersnotfir, Map<Filter, bool>>(
  (ref) => Filtersnotfir(),
);
final fillermealsprovider = Provider((ref) {
  final meals = ref.watch(mealprovider);
  final activefil = ref.watch(filtersprovider);
  return meals.where(
    (meal) {
      if (activefil[Filter.glutenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activefil[Filter.lactosefree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activefil[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (activefil[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    },
  ).toList();
});
