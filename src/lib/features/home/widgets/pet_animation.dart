import 'package:flutter/material.dart';
import 'package:cat_app/constants/pet_states.dart';

class PetAnimation extends StatelessWidget {
  final PetState state;
  final String name;

  const PetAnimation({
    Key? key,
    required this.state,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          state.emoji,
          style: const TextStyle(fontSize: 100),
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
