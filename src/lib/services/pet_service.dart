import 'dart:async';
import 'package:cat_app/models/pet.dart';
import 'package:cat_app/constants/pet_states.dart';

class PetService {
  Pet? _currentPet;
  Timer? _decayTimer;
  final _decayInterval = const Duration(minutes: 1);

  Pet? get currentPet => _currentPet;

  void initializePet(String name) {
    _currentPet = Pet.initial(name);
    _startDecayTimer();
  }

  void _startDecayTimer() {
    _decayTimer?.cancel();
    _decayTimer = Timer.periodic(_decayInterval, (_) => _updatePetStats());
  }

  void _updatePetStats() {
    if (_currentPet == null) return;

    final now = DateTime.now();
    final timeSinceLastFed = now.difference(_currentPet!.lastFed);
    final timeSinceLastPlayed = now.difference(_currentPet!.lastPlayed);
    final timeSinceLastSlept = now.difference(_currentPet!.lastSlept);

    var newHunger = _currentPet!.hunger - (timeSinceLastFed.inMinutes);
    var newHappiness =
        _currentPet!.happiness - (timeSinceLastPlayed.inMinutes ~/ 2);
    var newEnergy = _currentPet!.energy - (timeSinceLastSlept.inMinutes ~/ 3);

    newHunger = newHunger.clamp(0, 100);
    newHappiness = newHappiness.clamp(0, 100);
    newEnergy = newEnergy.clamp(0, 100);

    var newHealth = ((newHunger + newHappiness + newEnergy) / 3).round();
    var newState =
        _determineState(newHunger, newHappiness, newEnergy, newHealth);

    _currentPet = _currentPet!.copyWith(
      hunger: newHunger,
      happiness: newHappiness,
      energy: newEnergy,
      health: newHealth,
      state: newState,
    );
  }

  PetState _determineState(int hunger, int happiness, int energy, int health) {
    if (health <= 0) return PetState.dead;
    if (hunger <= 20) return PetState.hungry;
    if (energy <= 20) return PetState.sleeping;
    if (happiness >= 80) return PetState.happy;
    if (happiness <= 20) return PetState.sad;
    if (health <= 30) return PetState.sick;
    return PetState.normal;
  }

  void feed() {
    if (_currentPet == null) return;
    if (_currentPet!.state == PetState.dead) return;

    var newHunger = _currentPet!.hunger + 30;
    newHunger = newHunger.clamp(0, 100);

    _currentPet = _currentPet!.copyWith(
      hunger: newHunger,
      lastFed: DateTime.now(),
    );
    _updatePetStats();
  }

  void play() {
    if (_currentPet == null) return;
    if (_currentPet!.state == PetState.dead) return;

    var newHappiness = _currentPet!.happiness + 20;
    var newEnergy = _currentPet!.energy - 10;

    newHappiness = newHappiness.clamp(0, 100);
    newEnergy = newEnergy.clamp(0, 100);

    _currentPet = _currentPet!.copyWith(
      happiness: newHappiness,
      energy: newEnergy,
      lastPlayed: DateTime.now(),
      state: PetState.playing,
    );
    _updatePetStats();
  }

  void sleep() {
    if (_currentPet == null) return;
    if (_currentPet!.state == PetState.dead) return;

    var newEnergy = _currentPet!.energy + 40;
    newEnergy = newEnergy.clamp(0, 100);

    _currentPet = _currentPet!.copyWith(
      energy: newEnergy,
      lastSlept: DateTime.now(),
      state: PetState.sleeping,
    );
    _updatePetStats();
  }

  void dispose() {
    _decayTimer?.cancel();
    _currentPet = null;
  }
}
