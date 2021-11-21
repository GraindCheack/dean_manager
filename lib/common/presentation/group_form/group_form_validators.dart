import 'package:dean_manager/common/services/db_service.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

abstract class GroupValidators {
  static Map<String, dynamic>? groupUnique(
    AbstractControl<dynamic> control,
  ) {
    if (control.isNull || control.value is! String) {
      return {'Incorrect value': true};
    }
    final groupsId = Get.find<DbService>().groups.indexWhere(
          (e) => e.name == control.value,
        );
    return groupsId < 0 ? null : {'Group already exists': true};
  }
}
