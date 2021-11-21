import 'package:dean_manager/common/helpers/form_validators.dart';
import 'package:dean_manager/common/hive/student/student_hive.dart';
import 'package:dean_manager/common/presentation/custom_button/custom_button.dart';
import 'package:dean_manager/common/presentation/custom_input/custom_input_config.dart';
import 'package:dean_manager/common/presentation/offset/offset.dart';
import 'package:dean_manager/common/services/db_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class StudentForm extends StatelessWidget {
  StudentForm({
    Key? key,
    required this.onSubmit,
    this.student,
  }) : super(key: key) {
    form = fb.group({
      'firstName': [student?.firstName ?? '', Validators.required],
      'middleName': [student?.middleName ?? '', Validators.required],
      'lastName': [student?.lastName ?? '', Validators.required],
      'group': [
        student?.group.name ?? '',
        Validators.required,
        FormValidators.groupExistance
      ],
    });
  }

  final StudentHive? student;
  final void Function(StudentHive) onSubmit;
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
          ReactiveTextField(
            formControlName: 'group',
            textInputAction: TextInputAction.next,
            decoration: CustomInputConfig.getDecoration(title: 'Group name'),
          ),
          const DeanOffset.vertical(),
          ReactiveFormConsumer(
            builder: (context, form, child) {
              return CustomButton(
                isInline: true,
                child: Text(student == null ? 'Create' : 'Edit'),
                onPressed: form.valid ? _onSubmit : null,
              );
            },
          ),
        ],
      ),
    );
  }

  void _onSubmit() {
    final students = Get.find<DbService>().students;
    final groups = Get.find<DbService>().groups;
    final groupId = groups.indexWhere(
      (e) => e.name == form.value['group'] as String,
    );

    if (groupId < 0) {
      form.control('group').setErrors({'Group is not found': true});
      return;
    }

    final newStudent = StudentHive(
      firstName: form.value['firstName'] as String,
      lastName: form.value['lastName'] as String,
      middleName: form.value['middleName'] as String,
      group: groups[groupId],
    );

    final studentId =
        students.indexWhere((e) => e.fullName == newStudent.fullName);

    if (studentId >= 0) {
      form.control('lastName').setErrors({'Student already exist': true});
      return;
    }
    onSubmit(newStudent);
  }
}
