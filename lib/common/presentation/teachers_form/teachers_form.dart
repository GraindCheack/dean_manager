import 'package:dean_manager/common/hive/teacher/teacher_hive.dart';
import 'package:dean_manager/common/presentation/custom_button/custom_button.dart';
import 'package:dean_manager/common/presentation/custom_input/custom_input_config.dart';
import 'package:dean_manager/common/presentation/custom_select/custom_select.dart';
import 'package:dean_manager/common/presentation/custom_select/custom_select_item.dart';
import 'package:dean_manager/common/presentation/offset/offset.dart';
import 'package:dean_manager/common/services/db_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TeacherForm extends StatelessWidget {
  TeacherForm({
    Key? key,
    required this.onSubmit,
    this.teacher,
  }) : super(key: key) {
    form = fb.group({
      'firstName': [teacher?.firstName ?? '', Validators.required],
      'middleName': [teacher?.middleName ?? '', Validators.required],
      'lastName': [teacher?.lastName ?? '', Validators.required],
      'groups': [teacher?.lastName ?? '', Validators.required],
    });
  }

  final TeacherHive? teacher;
  final void Function(TeacherHive) onSubmit;
  late final FormGroup form;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: <Widget>[
          ReactiveTextField(
            formControlName: 'firstName',
            textInputAction: TextInputAction.next,
            decoration: CustomInputConfig.getDecoration(title: 'First name'),
          ),
          const DeanOffset.vertical(),
          ReactiveTextField(
            formControlName: 'middleName',
            textInputAction: TextInputAction.next,
            decoration: CustomInputConfig.getDecoration(title: 'Middle name'),
          ),
          const DeanOffset.vertical(),
          ReactiveTextField(
            formControlName: 'lastName',
            textInputAction: TextInputAction.next,
            decoration: CustomInputConfig.getDecoration(title: 'Last name'),
          ),
          const DeanOffset.vertical(),
          CustomSelect(
            title: 'Select groups',
            items: Get.find<DbService>()
                .groups
                .map(
                  (e) => CustomSelectItem(
                    name: e.name,
                    object: e,
                  ),
                )
                .toList(),
            formName: 'groups',
          ),
          const DeanOffset.vertical(),
          ReactiveFormConsumer(
            builder: (context, form, child) {
              return CustomButton(
                isInline: true,
                child: Text(teacher == null ? 'Create' : 'Edit'),
                onPressed: form.valid ? _onSubmit : null,
              );
            },
          ),
        ],
      ),
    );
  }

  void _onSubmit() {
    final newTeacher = TeacherHive(
      firstName: form.value['firstName'] as String,
      lastName: form.value['lastName'] as String,
      middleName: form.value['middleName'] as String,
    );
    onSubmit(newTeacher);
  }
}
