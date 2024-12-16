import 'package:cat_app/app/app.locator.dart';
import 'package:cat_app/app/app.router.dart';
import 'package:cat_app/services/pet_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _petService = locator<PetService>();
  final _dialogService = locator<DialogService>();

  String _petName = '';
  String get petName => _petName;

  void updatePetName(String value) {
    _petName = value;
    notifyListeners();
  }

  Future<void> createPet() async {
    if (_petName.trim().isEmpty) {
      await _dialogService.showDialog(
        title: 'Invalid Name',
        description: 'Please enter a name for your pet.',
      );
      return;
    }

    setBusy(true);
    try {
      _petService.initializePet(_petName);
      await _navigationService.replaceWithHomeView();
    } catch (e) {
      await _dialogService.showDialog(
        title: 'Error',
        description: 'Failed to create pet. Please try again.',
      );
    } finally {
      setBusy(false);
    }
  }
}
