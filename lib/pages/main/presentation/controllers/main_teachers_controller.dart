import 'package:dean_manager/common/hive/teacher/teacher_hive.dart';
import 'package:dean_manager/pages/main/presentation/controllers/main_controller.dart';
import 'package:get/get.dart';

class MainTeachersController extends SuperController<List<TeacherHive>> {
  MainTeachersController({required this.mainController});

  final MainController mainController;

  @override
  void onInit() {
    append(() => mainController.mainRepository.getTeachers);
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
