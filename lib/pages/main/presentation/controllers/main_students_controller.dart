import 'package:dean_manager/common/hive/student/student_hive.dart';
import 'package:dean_manager/pages/main/presentation/controllers/main_controller.dart';
import 'package:get/get.dart';

class MainStudentsController extends SuperController<List<StudentHive>> {
  MainStudentsController({required this.mainController});

  final MainController mainController;
  final search = ''.obs;

  void searchChange(String value) => search.value = value;

  @override
  void onInit() {
    append(() => mainController.mainRepository.getStudents);
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
