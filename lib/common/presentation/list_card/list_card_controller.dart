import 'package:get/get.dart';

class ListCardController extends GetxController {
  var isHover = false.obs;
  void changeHover(bool value) => isHover.value = value;
}
