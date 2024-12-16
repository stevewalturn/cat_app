import 'package:flutter/material.dart';

class PetActions extends StatelessWidget {
  final VoidCallback onFeed;
  final VoidCallback onPlay;
  final VoidCallback onSleep;

  const PetActions({
    Key? key,
    required this.onFeed,
    required this.onPlay,
    required this.onSleep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton(
          onPressed: onFeed,
          icon: Icons.restaurant,
          label: 'Feed',
          color: Colors.orange,
        ),
        _buildActionButton(
          onPressed: onPlay,
          icon: Icons.sports_esports,
          label: 'Play',
          color: Colors.purple,
        ),
        _buildActionButton(
          onPressed: onSleep,
          icon: Icons.bed,
          label: 'Sleep',
          color: Colors.blue,
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
          ),
          child: Icon(
            icon,
            size: 32,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
