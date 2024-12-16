import 'package:equatable/equatable.dart';
import 'package:cat_app/constants/pet_states.dart';
import 'package:cat_app/constants/cat_colors.dart';

class Pet extends Equatable {
  final String name;
  final int hunger;
  final int happiness;
  final int energy;
  final int health;
  final PetState state;
  final CatColor color;
  final DateTime lastFed;
  final DateTime lastPlayed;
  final DateTime lastSlept;

  const Pet({
    required this.name,
    required this.hunger,
    required this.happiness,
    required this.energy,
    required this.health,
    required this.state,
    required this.color,
    required this.lastFed,
    required this.lastPlayed,
    required this.lastSlept,
  });

  Pet copyWith({
    String? name,
    int? hunger,
    int? happiness,
    int? energy,
    int? health,
    PetState? state,
    CatColor? color,
    DateTime? lastFed,
    DateTime? lastPlayed,
    DateTime? lastSlept,
  }) {
    return Pet(
      name: name ?? this.name,
      hunger: hunger ?? this.hunger,
      happiness: happiness ?? this.happiness,
      energy: energy ?? this.energy,
      health: health ?? this.health,
      state: state ?? this.state,
      color: color ?? this.color,
      lastFed: lastFed ?? this.lastFed,
      lastPlayed: lastPlayed ?? this.lastPlayed,
      lastSlept: lastSlept ?? this.lastSlept,
    );
  }

  factory Pet.initial(String name, CatColor color) {
    final now = DateTime.now();
    return Pet(
      name: name,
      hunger: 100,
      happiness: 100,
      energy: 100,
      health: 100,
      state: PetState.normal,
      color: color,
      lastFed: now,
      lastPlayed: now,
      lastSlept: now,
    );
  }

  @override
  List<Object?> get props => [
        name,
        hunger,
        happiness,
        energy,
        health,
        state,
        color,
        lastFed,
        lastPlayed,
        lastSlept,
      ];
}
