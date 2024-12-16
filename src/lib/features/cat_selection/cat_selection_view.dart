import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cat_app/features/cat_selection/widgets/cat_preview.dart';
import 'package:cat_app/features/cat_selection/widgets/cat_color_option.dart';
import 'cat_selection_viewmodel.dart';

class CatSelectionView extends StackedView<CatSelectionViewModel> {
  final String petName;

  const CatSelectionView({
    Key? key,
    required this.petName,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CatSelectionViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Choose Your Cat',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              CatPreview(
                color: viewModel.selectedColor,
                name: petName,
              ),
              const SizedBox(height: 32),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: viewModel.availableColors
                      .map(
                        (color) => CatColorOption(
                          color: color,
                          isSelected: color == viewModel.selectedColor,
                          onTap: () => viewModel.selectColor(color),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: viewModel.isBusy
                      ? null
                      : () => viewModel.createPet(petName),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: viewModel.isBusy
                      ? const CircularProgressIndicator()
                      : const Text(
                          'Create Pet',
                          style: TextStyle(fontSize: 18),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  CatSelectionViewModel viewModelBuilder(BuildContext context) =>
      CatSelectionViewModel();
}
