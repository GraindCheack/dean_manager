import 'package:dean_manager/pages/main/data/main_api_provider.dart';
import 'package:dean_manager/pages/main/data/main_repository.dart';
import 'package:dean_manager/pages/main/domain/interfaces/i_main_provider.dart';
import 'package:dean_manager/pages/main/domain/interfaces/i_main_repository.dart';
import 'package:dean_manager/pages/main/presentation/controllers/main_controller.dart';
import 'package:dean_manager/pages/main/presentation/controllers/main_groups_contorller.dart';
import 'package:dean_manager/pages/main/presentation/controllers/main_students_controller.dart';
import 'package:dean_manager/pages/main/presentation/controllers/main_teachers_controller.dart';
import 'package:get/get.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IMainProvider>(() => MainProvider());
    Get.lazyPut<IMainRepository>(() => MainRepository(provider: Get.find()));
    Get.lazyPut(() => MainController(mainRepository: Get.find()));
    Get.lazyPut(() => MainGroupsController(mainController: Get.find()));
    Get.lazyPut(() => MainStudentsController(mainController: Get.find()));
    Get.lazyPut(() => MainTeachersController(mainController: Get.find()));
  }
}
