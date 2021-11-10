import 'package:dean_manager/pages/main/domain/interfaces/i_main_repository.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  MainController({required this.mainRepository});

  final IMainRepository mainRepository;
}
