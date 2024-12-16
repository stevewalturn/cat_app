import 'package:flutter/material.dart';
import 'package:cat_app/models/pet.dart';

class PetStatusBar extends StatelessWidget {
  final Pet pet;

  const PetStatusBar({
    Key? key,
    required this.pet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildStatusBar('Health', pet.health, Colors.red),
        const SizedBox(height: 8),
        _buildStatusBar('Hunger', pet.hunger, Colors.orange),
        const SizedBox(height: 8),
        _buildStatusBar('Happiness', pet.happiness, Colors.yellow),
        const SizedBox(height: 8),
        _buildStatusBar('Energy', pet.energy, Colors.blue),
      ],
    );
  }

  Widget _buildStatusBar(String label, int value, Color color) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: value / 100,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 10,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '$value%',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
