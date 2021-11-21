import 'package:dean_manager/common/constants/colors_constants.dart';
import 'package:dean_manager/common/constants/text_constants.dart';
import 'package:dean_manager/common/presentation/custom_dropdown/custom_dropdown.dart';
import 'package:dean_manager/common/presentation/custom_input/custom_input_config.dart';
import 'package:dean_manager/common/presentation/custom_search/custom_input.dart';
import 'package:dean_manager/common/presentation/custom_select/custom_select_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomSelect<T> extends StatelessWidget {
  const CustomSelect({
    Key? key,
    required this.title,
    this.items = const [],
    this.formName,
  }) : super(key: key);

  final String title;
  final String? formName;
  final List<CustomSelectItem<T>> items;

  @override
  Widget build(BuildContext context) {
    if (formName == null) {
      return CustomInput(
        title: title,
        readOnly: true,
      );
    }
    return CustomDropdown(
      child: ReactiveTextField(
        readOnly: true,
        formControlName: formName,
        textInputAction: TextInputAction.next,
        decoration: CustomInputConfig.getDecoration(title: title),
      ),
      items: [
        InkWell(
          onTap: () {},
          onHover: (v) {},
          child: Ink(
            width: double.infinity,
            height: 50,
            child: const Center(
              child: Text('Clear'),
            ),
          ),
        ),
        ...items
            .map(
              (e) => InkWell(
                onTap: () {
                  e.selected != e.selected;
                },
                onHover: (v) {},
                child: Ink(
                  width: double.infinity,
                  height: 50,
                  color: e.selected ? ColorsConst.lightBlue : null,
                  child: DefaultTextStyle(
                    style: TextStylesConst.m.copyWith(
                      color: e.selected ? ColorsConst.white : Colors.black,
                    ),
                    child: Center(
                      child: Text(e.name),
                    ),
                  ),
                ),
              ),
            )
            .toList()
      ],
    );
  }
}
