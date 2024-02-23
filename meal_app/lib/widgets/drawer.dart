import 'package:flutter/material.dart';
import 'package:meal_app/main.dart';

class DrawerData extends StatelessWidget {
  const DrawerData({super.key, required this.setScreen});
  final void Function(String identifier) setScreen;
  @override
  Widget build(BuildContext context) {
    bool theme = MediaQuery.of(context).platformBrightness == Brightness.dark;
    Color textColor = theme ? kdarkcolorScheme.primary : kcolorScheme.primary;
    return Drawer(
      elevation: 10,
      clipBehavior: Clip.hardEdge,
      child: Column(children: [
        DrawerHeader(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              kcolorScheme.primaryContainer,
              kdarkcolorScheme.secondaryContainer.withOpacity(0.5)
            ], begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          ),
          child: Row(
            children: [
              Icon(Icons.food_bank,
                  size: 48, color: Theme.of(context).colorScheme.onBackground),
              Text(
                'Cooking Up!',
                style: theme
                    ? Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: kcolorScheme.tertiaryContainer)
                    : Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: kdarkcolorScheme.tertiaryContainer),
              )
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.restaurant,
              size: 26, color: Theme.of(context).colorScheme.primaryContainer),
          title: Text('Meal',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: textColor)),
          contentPadding: const EdgeInsets.all(10),
          onTap: () {
            setScreen('Meal');
          },
        ),
        ListTile(
          leading: Icon(Icons.settings,
              size: 26, color: Theme.of(context).colorScheme.primaryContainer),
          title: Text('Filter',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: textColor)),
          contentPadding: const EdgeInsets.all(10),
          onTap: () {
            setScreen('Filter');
          },
        ),
      ]),
    );
  }
}
