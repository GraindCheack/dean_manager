import 'package:dean_manager/common/services/db_service.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

abstract class FormValidators {
  static Map<String, dynamic>? groupExistance(
    AbstractControl<dynamic> control,
  ) {
    if (control.isNull || control.value is! String) {
      return {'Incorrect value': true};
    }
    final groups = Get.find<DbService>().groups.where(
          (e) => e.name == control.value,
        );
    return groups.length == 1 ? null : {'No such group exists': true};
  }
}
