import 'package:dean_manager/common/hive/group/group_hive.dart';
import 'package:dean_manager/pages/main/presentation/controllers/main_controller.dart';
import 'package:get/get.dart';

class MainGroupsController extends SuperController<List<GroupHive>> {
  MainGroupsController({required this.mainController});

  final MainController mainController;

  @override
  void onInit() {
    append(() => mainController.mainRepository.getGroups);
    super.onInit();
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
}
