import 'package:get/get.dart';

abstract class IMainFilterController<T> {
  RxString filter = ''.obs;
  RxBool hidden = false.obs;
  RxList<T> list = <T>[].obs;
  T? selected;
  void clearFilters();
  void addBtnHandler();
}
