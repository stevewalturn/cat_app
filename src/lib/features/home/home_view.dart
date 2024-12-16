import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cat_app/features/home/widgets/pet_animation.dart';
import 'package:cat_app/features/home/widgets/pet_status_bar.dart';
import 'package:cat_app/features/home/widgets/pet_actions.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    final pet = viewModel.pet;

    if (pet == null) {
      return const Scaffold(
        body: Center(
          child: Text('No pet found. Please restart the app.'),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              PetAnimation(
                state: pet.state,
                name: pet.name,
                color: pet.color,
              ),
              const SizedBox(height: 32),
              PetStatusBar(pet: pet),
              const Spacer(),
              PetActions(
                onFeed: viewModel.feed,
                onPlay: viewModel.play,
                onSleep: viewModel.sleep,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
