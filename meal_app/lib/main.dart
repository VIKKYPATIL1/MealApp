import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/screen/tab.dart';

final kcolorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 238, 121, 121));
final kdarkcolorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 200, 93, 93));

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    theme: ThemeData().copyWith(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
            actionsIconTheme:
                const IconThemeData().copyWith(color: kcolorScheme.primary),
            backgroundColor: kcolorScheme.primaryContainer,
            elevation: 10)),
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      appBarTheme: AppBarTheme(
          actionsIconTheme:
              const IconThemeData().copyWith(color: kdarkcolorScheme.primary),
          backgroundColor: kdarkcolorScheme.primaryContainer,
          elevation: 10),
    ),
    home: const TabScreen(),
  )));
}
