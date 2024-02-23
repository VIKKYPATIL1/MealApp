import 'package:flutter/material.dart';
import 'package:meal_app/main.dart';
import 'package:meal_app/widgets/grid_item_trat.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meal_app/model/meal_model.dart';

class MealItems extends StatelessWidget {
  const MealItems({super.key, required this.meal, required this.selectedMeal});
  final void Function(Meal meal) selectedMeal;
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectedMeal(meal);
      },
      borderRadius: BorderRadius.circular(30),
      splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
      splashColor: kcolorScheme.tertiaryContainer,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 10,
        margin: const EdgeInsets.all(10),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.black,
          child: Stack(alignment: Alignment.bottomCenter, children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                fit: BoxFit.fill,
                height: 200,
                width: double.infinity,
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(1),
                    Colors.black.withOpacity(0.2),
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                  // color: Color.fromARGB(255, 47, 40, 40).withOpacity(0.5),
                  child: Column(children: [
                    Text(meal.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: kcolorScheme.inversePrimary)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GridItemTrat(
                            icon: Icons.work, label: meal.complexity.name),
                        const SizedBox(
                          width: 10,
                        ),
                        GridItemTrat(
                            icon: Icons.timelapse,
                            label: '${meal.duration} min'),
                      ],
                    ),
                  ]),
                ))
          ]),
        ),
      ),
    );
  }
}
