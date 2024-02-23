import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/main.dart';
import 'package:meal_app/model/meal_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/favorite_mealprovider.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMealprovider = ref.watch(favoriteMealProvider);
    bool isChecked = favoriteMealprovider.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteMealProvider.notifier)
                    .toggleMealFavoriteStatus(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(wasAdded
                      ? 'Added to Favorite items'
                      : 'Remove From Favorite Item'),
                  backgroundColor: MediaQuery.of(context).platformBrightness ==
                          Brightness.dark
                      ? kcolorScheme.secondaryContainer
                      : kdarkcolorScheme.secondaryContainer,
                ));
              },
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                      scale:
                          Tween<double>(begin: 0.2, end: 1).animate(animation),
                      child: child);
                },
                child: Icon(isChecked ? Icons.favorite : Icons.favorite_border,
                    key: ValueKey(isChecked)),
              ))
        ],
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            clipBehavior: Clip.hardEdge,
            child: Hero(
              tag: meal.id,
              child: Image(
                  fit: BoxFit.fill,
                  height: 300,
                  width: double.infinity,
                  image: NetworkImage(meal.imageUrl)),
            ),
          ),
          Card(
            elevation: 10,
            margin: const EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: SizedBox(
              height: 310,
              width: 440,
              child: SingleChildScrollView(
                dragStartBehavior: DragStartBehavior.start,
                padding: const EdgeInsets.all(8),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: const BouncingScrollPhysics(),
                reverse: false,
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Text(
                      'Ingredients :- ',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? kcolorScheme.tertiaryContainer
                              : kdarkcolorScheme.tertiaryContainer),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    for (var ingredient in meal.ingredients)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                          ingredient,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: MediaQuery.of(context)
                                              .platformBrightness ==
                                          Brightness.dark
                                      ? kcolorScheme.tertiaryContainer
                                      : kdarkcolorScheme.tertiaryContainer),
                        ),
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Steps :- ',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? kcolorScheme.tertiaryContainer
                              : kdarkcolorScheme.tertiaryContainer),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    for (var step in meal.steps)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                          textAlign: TextAlign.center,
                          step,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: MediaQuery.of(context)
                                              .platformBrightness ==
                                          Brightness.dark
                                      ? kcolorScheme.tertiaryContainer
                                      : kdarkcolorScheme.tertiaryContainer),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
