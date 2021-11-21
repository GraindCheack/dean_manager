import 'package:dean_manager/common/constants/colors_constants.dart';
import 'package:dean_manager/common/constants/size_constants.dart';
import 'package:dean_manager/common/presentation/custom_button/custom_button.dart';
import 'package:dean_manager/common/presentation/list_card/list_card_view.dart';
import 'package:dean_manager/common/presentation/offset/offset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainListCard<T> extends StatelessWidget {
  const MainListCard(
    this.text, {
    Key? key,
    this.selected = false,
    this.object,
    this.onPressed,
    this.onEdit,
    this.onDelete,
  }) : super(key: key);

  final String text;
  final bool selected;
  final T? object;

  final void Function(T?)? onPressed;
  final void Function(T?)? onEdit;
  final void Function(T?)? onDelete;

  @override
  Widget build(BuildContext context) {
    return DeanListCard(
      text,
      selected: selected,
      onPressed: () {
        final onPressedLocal = onPressed;
        if (onPressedLocal != null) {
          onPressedLocal(object);
        }
      },
      hoverActionChild: Row(
        children: [
          CustomButton(
            color: Colors.transparent,
            hoverColor: ColorsConst.gray,
            padding: const EdgeInsets.all(OffsetConst.xs),
            child: const Icon(Icons.mode_edit_outline_outlined),
            onPressed: () {
              final onEditLocal = onEdit;
              if (onEditLocal != null) {
                onEditLocal(object);
              }
            },
          ),
          const DeanOffset.horizontal(OffsetConst.xs),
          CustomButton(
            color: Colors.transparent,
            hoverColor: ColorsConst.gray,
            padding: const EdgeInsets.all(OffsetConst.xs),
            child: const Icon(Icons.delete),
            onPressed: () {
              final onDeleteLocal = onDelete;
              if (onDeleteLocal != null) {
                onDeleteLocal(object);
              }
            },
          ),
        ],
      ),
    );
  }
}
