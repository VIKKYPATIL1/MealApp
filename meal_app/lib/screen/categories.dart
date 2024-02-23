// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/model/category_model.dart';
import 'package:meal_app/model/meal_model.dart';
import 'package:meal_app/screen/meal.dart';
import 'package:meal_app/widgets/grid_view.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availableMeal});
  final List<Meal> availableMeal;

  void selectCategory(BuildContext context, Category category) {
    List<Meal> meal = availableMeal
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealScreen(title: category.title, meal: meal),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
        children: [
          for (var category in availableCategories)
            GridViewItem(
              category: category,
              selectedCategory: () {
                selectCategory(context, category);
              },
            )
        ]);
  }
}
