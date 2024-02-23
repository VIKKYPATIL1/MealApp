import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/meals_provider.dart';

enum Filters { glutenfree, vegan, vegetarian, lactosefree }

class FilterProviderNotifier extends StateNotifier<Map<Filters, bool>> {
  FilterProviderNotifier()
      : super({
          Filters.glutenfree: false,
          Filters.lactosefree: false,
          Filters.vegan: false,
          Filters.vegetarian: false,
        });

  void setFilters(Map<Filters, bool> choosenFilters) {
    state = choosenFilters;
  }

  void setFilter(Filters favoriteFilters, bool isActive) {
    state = {...state, favoriteFilters: isActive};
  }
}

final filtersprovider =
    StateNotifierProvider<FilterProviderNotifier, Map<Filters, bool>>(
        (ref) => FilterProviderNotifier());

final filterMealProvider = Provider((ref) {
  final mealProviders = ref.watch(mealProvider);
  final activeFiltersProvider = ref.watch(filtersprovider);
  return mealProviders.where((meal) {
    if (activeFiltersProvider[Filters.glutenfree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFiltersProvider[Filters.vegan]! && !meal.isVegan) {
      return false;
    }
    if (activeFiltersProvider[Filters.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFiltersProvider[Filters.lactosefree]! && !meal.isLactoseFree) {
      return false;
    }
    return true;
  }).toList();
});
