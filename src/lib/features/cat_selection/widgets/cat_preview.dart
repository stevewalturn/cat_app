import 'package:flutter/material.dart';
import 'package:cat_app/constants/cat_colors.dart';

class CatPreview extends StatelessWidget {
  final CatColor color;
  final String name;

  const CatPreview({
    Key? key,
    required this.color,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color.color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Text(
            color.emoji,
            style: const TextStyle(fontSize: 80),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'A ${color.name.toLowerCase()} cat',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
