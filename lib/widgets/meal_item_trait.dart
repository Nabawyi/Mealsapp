import 'package:flutter/material.dart';

class MealItemTrail extends StatelessWidget {
  const MealItemTrail({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: Colors.white,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          softWrap: true,
          maxLines: 1,
          label,
          style: const TextStyle(
              overflow: TextOverflow.clip, color: Colors.white),
        ),
      ],
    );
  }
}
