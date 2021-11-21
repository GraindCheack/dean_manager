import 'package:dean_manager/common/hive/group/group_hive.dart';
import 'package:dean_manager/common/presentation/custom_button/custom_button.dart';
import 'package:dean_manager/common/presentation/custom_input/custom_input_config.dart';
import 'package:dean_manager/common/presentation/group_form/group_form_validators.dart';
import 'package:dean_manager/common/presentation/offset/offset.dart';
import 'package:flutter/cupertino.dart';
import 'package:reactive_forms/reactive_forms.dart';

class GroupForm extends StatelessWidget {
  GroupForm({
    Key? key,
    this.group,
    required this.onSubmit,
  }) : super(key: key) {
    form = fb.group({
      'name': [
        group?.name ?? '',
        Validators.required,
        GroupValidators.groupUnique,
      ],
    });
  }

  final GroupHive? group;
  final void Function(GroupHive) onSubmit;
  late final FormGroup form;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: <Widget>[
          ReactiveTextField(
            formControlName: 'name',
            textInputAction: TextInputAction.next,
            decoration: CustomInputConfig.getDecoration(title: 'Name'),
          ),
          const DeanOffset.vertical(),
          ReactiveFormConsumer(
            builder: (context, form, child) {
              return CustomButton(
                isInline: true,
                child: Text(group == null ? 'Create' : 'Edit'),
                onPressed: form.valid ? _onSubmit : null,
              );
            },
          ),
        ],
      ),
    );
  }

  void _onSubmit() {
    final newGroup = GroupHive(name: form.value['name'] as String);
    onSubmit(newGroup);
  }
}
