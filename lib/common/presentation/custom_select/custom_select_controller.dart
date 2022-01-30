import 'package:dean_manager/common/presentation/custom_select/custom_select_item.dart';
import 'package:get/state_manager.dart';

class CustomSelectController<T> extends GetxController {
  CustomSelectController({required this.items});
  final RxList<CustomSelectItem<T>> items;
}
