import 'package:dean_manager/common/constants/size_constants.dart';
import 'package:dean_manager/common/presentation/custom_search/custom_input_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    Key? key,
    this.height = CustomInputConfig.height,
    this.onChanged,
    this.onSubmitted,
    this.width,
    this.suffix,
  }) : super(key: key);

  final double height;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final double? width;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        expands: true,
        maxLines: null,
        keyboardType: TextInputType.text,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: OffsetConst.xs,
            horizontal: OffsetConst.m,
          ),
          border: const OutlineInputBorder(),
          labelText: 'Search',
          suffixIcon: suffix,
        ),
      ),
    );
  }
}
