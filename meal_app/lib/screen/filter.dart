import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/main.dart';
import 'package:meal_app/providers/filters_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filtersMealProvider = ref.watch(filtersprovider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      body: Column(children: [
        Card(
          color: const Color.fromARGB(255, 180, 135, 132),
          child: SwitchListTile(
            activeColor: kdarkcolorScheme.secondaryContainer,
            controlAffinity: ListTileControlAffinity.platform,
            splashRadius: BorderSide.strokeAlignOutside,
            title: const Text('Gluten Free'),
            subtitle: const Text('Only include Gluten Free Items'),
            value: filtersMealProvider[Filters.glutenfree]!,
            onChanged: (value) {
              ref
                  .read(filtersprovider.notifier)
                  .setFilter(Filters.glutenfree, value);
            },
          ),
        ),
        Card(
          color: const Color.fromARGB(255, 180, 135, 132),
          child: SwitchListTile(
            activeColor: kdarkcolorScheme.secondaryContainer,
            controlAffinity: ListTileControlAffinity.platform,
            dragStartBehavior: DragStartBehavior.start,
            enableFeedback: filtersMealProvider[Filters.vegan],
            dense: false,
            splashRadius: BorderSide.strokeAlignOutside,
            title: const Text('Vegan'),
            subtitle: const Text('Only include Vegan'),
            value: filtersMealProvider[Filters.vegan]!,
            onChanged: (value) {
              ref
                  .read(filtersprovider.notifier)
                  .setFilter(Filters.vegan, value);
            },
          ),
        ),
        Card(
          color: const Color.fromARGB(255, 180, 135, 132),
          child: SwitchListTile(
            activeColor: kdarkcolorScheme.secondaryContainer,
            controlAffinity: ListTileControlAffinity.platform,
            dragStartBehavior: DragStartBehavior.start,
            enableFeedback: filtersMealProvider[Filters.vegetarian],
            dense: false,
            splashRadius: BorderSide.strokeAlignOutside,
            title: const Text('Vegetarian'),
            subtitle: const Text('Only include Vegetarian Items'),
            value: filtersMealProvider[Filters.vegetarian]!,
            onChanged: (value) {
              ref
                  .read(filtersprovider.notifier)
                  .setFilter(Filters.vegetarian, value);
            },
          ),
        ),
        Card(
          color: const Color.fromARGB(255, 180, 135, 132),
          child: SwitchListTile(
            activeColor: kdarkcolorScheme.secondaryContainer,
            controlAffinity: ListTileControlAffinity.platform,
            dragStartBehavior: DragStartBehavior.start,
            enableFeedback: filtersMealProvider[Filters.lactosefree],
            dense: false,
            splashRadius: BorderSide.strokeAlignOutside,
            title: const Text('Lactose Free'),
            subtitle: const Text('Only include Lactose Free Items Items'),
            value: filtersMealProvider[Filters.lactosefree]!,
            onChanged: (value) {
              ref
                  .read(filtersprovider.notifier)
                  .setFilter(Filters.lactosefree, value);
            },
          ),
        )
      ]),
    );
  }
}
