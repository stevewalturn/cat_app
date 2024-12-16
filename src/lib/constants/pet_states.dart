enum PetState { normal, happy, sad, sleeping, sick, hungry, playing, dead }

extension PetStateExtension on PetState {
  String get description {
    switch (this) {
      case PetState.normal:
        return 'Your pet is feeling normal';
      case PetState.happy:
        return 'Your pet is very happy!';
      case PetState.sad:
        return 'Your pet is feeling sad';
      case PetState.sleeping:
        return 'Your pet is sleeping...';
      case PetState.sick:
        return 'Your pet is sick!';
      case PetState.hungry:
        return 'Your pet is hungry!';
      case PetState.playing:
        return 'Your pet is playing';
      case PetState.dead:
        return 'Your pet has passed away...';
    }
  }
}
