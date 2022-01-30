import 'package:dean_manager/common/constants/colors_constants.dart';
import 'package:dean_manager/common/constants/text_constants.dart';
import 'package:dean_manager/common/presentation/custom_dropdown/custom_dropdown.dart';
import 'package:dean_manager/common/presentation/custom_input/custom_input_config.dart';
import 'package:dean_manager/common/presentation/custom_search/custom_input.dart';
import 'package:dean_manager/common/presentation/custom_select/custom_select_config.dart';
import 'package:dean_manager/common/presentation/custom_select/custom_select_controller.dart';
import 'package:dean_manager/common/presentation/custom_select/custom_select_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomSelect<T> extends StatelessWidget {
  const CustomSelect({
    Key? key,
    required this.child,
    required this.title,
    this.items = const [],
    this.onChanged,
  }) : super(key: key);

  final String title;
  final Widget child;
  final void Function(List<CustomSelectItem<T>>)? onChanged;
  final List<CustomSelectItem<T>> items;

  @override
  Widget build(BuildContext context) {
    final rxItems = items.obs
      ..stream.listen((newItems) {
        final localOnChanged = onChanged;
        if (localOnChanged != null) {
          localOnChanged(
            newItems.where((e) => e.selected).toList(),
          );
        }
      });
    return GetBuilder<CustomSelectController<T>>(
      init: CustomSelectController<T>(items: rxItems),
      assignId: true,
      builder: (controller) {
        return CustomDropdown(
          child: child,
          items: [
            InkWell(
              onTap: () => controller.items(
                controller.items.map((e) => e..selected = false).toList(),
              ),
              onHover: (v) {},
              child: Ink(
                width: double.infinity,
                height: CustomSelectConfig.itemHeight,
                child: const Center(
                  child: Text('Clear'),
                ),
              ),
            ),
            Obx(
              () => Column(
                children: controller.items
                    .map(
                      (e) => InkWell(
                        onTap: () {
                          controller.items(
                            controller.items
                                .map(
                                  (item) => e == item
                                      ? (item..selected = !item.selected)
                                      : item,
                                )
                                .toList(),
                          );
                        },
                        onHover: (v) {},
                        child: Ink(
                          width: double.infinity,
                          height: CustomSelectConfig.itemHeight,
                          decoration: BoxDecoration(
                            color: e.selected ? ColorsConst.lightBlue : null,
                            border: const Border(
                              top: BorderSide(
                                width: 1,
                                color: ColorsConst.white,
                              ),
                            ),
                          ),
                          child: DefaultTextStyle(
                            style: TextStylesConst.m.copyWith(
                              color:
                                  e.selected ? ColorsConst.white : Colors.black,
                            ),
                            child: Center(
                              child: Text(e.name),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
