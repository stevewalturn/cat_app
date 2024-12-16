import 'package:cat_app/app/app.locator.dart';
import 'package:cat_app/models/pet.dart';
import 'package:cat_app/services/pet_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ReactiveViewModel {
  final _petService = locator<PetService>();
  final _dialogService = locator<DialogService>();

  Pet? get pet => _petService.currentPet;

  void feed() {
    if (pet == null) {
      _showError('No pet exists! Please restart the app.');
      return;
    }
    _petService.feed();
    notifyListeners();
  }

  void play() {
    if (pet == null) {
      _showError('No pet exists! Please restart the app.');
      return;
    }
    _petService.play();
    notifyListeners();
  }

  void sleep() {
    if (pet == null) {
      _showError('No pet exists! Please restart the app.');
      return;
    }
    _petService.sleep();
    notifyListeners();
  }

  void _showError(String message) {
    _dialogService.showDialog(
      title: 'Error',
      description: message,
      barrierDismissible: true,
    );
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_petService];
}
