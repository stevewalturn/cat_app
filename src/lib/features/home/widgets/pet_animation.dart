import 'package:flutter/material.dart';
import 'package:cat_app/constants/pet_states.dart';
import 'package:cat_app/constants/cat_colors.dart';

class PetAnimation extends StatelessWidget {
  final PetState state;
  final String name;
  final CatColor color;

  const PetAnimation({
    Key? key,
    required this.state,
    required this.name,
    required this.color,
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
            state == PetState.dead ? '💀' : color.emoji,
            style: const TextStyle(fontSize: 100),
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
          state.description,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
