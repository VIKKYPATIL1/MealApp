import 'package:flutter/material.dart';
import 'package:meal_app/providers/favorite_mealprovider.dart';
import 'package:meal_app/screen/categories.dart';
import 'package:meal_app/screen/filter.dart';
import 'package:meal_app/screen/meal.dart';
import 'package:meal_app/widgets/drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filters_provider.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});
  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

Map<Filters, bool> kInitialFilter = {
  Filters.glutenfree: false,
  Filters.vegan: false,
  Filters.vegetarian: false,
  Filters.lactosefree: false,
};

class _TabScreenState extends ConsumerState<TabScreen> {
  int selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filter') {
      await Navigator.of(context).push<Map<Filters, bool>>(MaterialPageRoute(
        builder: (context) => const FilterScreen(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMealsProvider = ref.watch(filterMealProvider);

    Widget content = CategoriesScreen(
      availableMeal: availableMealsProvider,
    );
    var activePageTitle = 'Categories';
    if (selectedPageIndex == 1) {
      activePageTitle = 'Favorites';
      final favoriteMeal = ref.watch(favoriteMealProvider);
      content = MealScreen(meal: favoriteMeal);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: DrawerData(
        setScreen: (identifier) {
          setScreen(identifier);
        },
      ),
      body: content,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            selectPage(index);
          },
          currentIndex: selectedPageIndex,
          selectedItemColor: Colors.amber,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal_rounded), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
          ]),
    );
  }
}
