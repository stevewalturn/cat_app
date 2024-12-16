import 'package:stacked/stacked.dart';
import 'package:cat_app/app/app.locator.dart';
import 'package:cat_app/app/app.router.dart';
import 'package:cat_app/constants/cat_colors.dart';
import 'package:cat_app/services/pet_service.dart';
import 'package:stacked_services/stacked_services.dart';

class CatSelectionViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _petService = locator<PetService>();
  final _dialogService = locator<DialogService>();

  CatColor _selectedColor = CatColor.orange;
  CatColor get selectedColor => _selectedColor;

  List<CatColor> get availableColors => CatColor.values;

  void selectColor(CatColor color) {
    _selectedColor = color;
    notifyListeners();
  }

  Future<void> createPet(String name) async {
    if (name.trim().isEmpty) {
      await _dialogService.showDialog(
        title: 'Invalid Name',
        description: 'Please enter a name for your pet.',
      );
      return;
    }

    setBusy(true);
    try {
      _petService.initializePet(name, _selectedColor);
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
