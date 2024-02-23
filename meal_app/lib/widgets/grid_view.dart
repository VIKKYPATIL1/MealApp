// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:meal_app/model/category_model.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({
    super.key,
    required this.selectedCategory,
    required this.category,
  });
  final void Function() selectedCategory;
  final Category category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: category.color,
      borderRadius: BorderRadius.circular(20),
      onTap: selectedCategory,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                colors: [category.color, category.color.withOpacity(0.5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Center(child: Text(category.title)),
      ),
    );
  }
}
