import 'package:cat_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:cat_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:cat_app/features/home/home_view.dart';
import 'package:cat_app/features/startup/startup_view.dart';
import 'package:cat_app/features/cat_selection/cat_selection_view.dart';
import 'package:cat_app/services/pet_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: CatSelectionView),
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: PetService),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
  ],
)
class App {}
