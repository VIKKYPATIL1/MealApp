import 'package:flutter/material.dart';

class GridItemTrat extends StatelessWidget {
  const GridItemTrat({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(color: Colors.white.withOpacity(0.8), icon),
        const SizedBox(
          width: 3,
        ),
        Text(style: TextStyle(color: Colors.white.withOpacity(0.9)), label),
      ],
    );
  }
}
