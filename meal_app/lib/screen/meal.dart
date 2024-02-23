import 'package:flutter/material.dart';
import 'package:meal_app/model/meal_model.dart';
import 'package:meal_app/screen/meal_detail.dart';
import 'package:meal_app/widgets/meal_items.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, this.title, required this.meal});
  final String? title;
  final List<Meal> meal;

  void selectedMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Card(
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        shadowColor: Theme.of(context).colorScheme.secondary,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Ohh! nothing here ',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.secondaryContainer),
            ),
            const SizedBox(height: 30),
            Text(
              'Try Adding Some ...',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            )
          ],
        ),
      ),
    );
    if (meal.isNotEmpty) {
      content = ListView.builder(
        itemCount: meal.length,
        itemBuilder: (context, index) => MealItems(
            meal: meal[index],
            selectedMeal: (meal) {
              selectedMeal(context, meal);
            }),
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
