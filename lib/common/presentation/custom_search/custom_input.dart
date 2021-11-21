import 'package:dean_manager/common/constants/size_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    Key? key,
    this.readOnly = false,
    this.enabled = true,
    this.controller,
    this.title,
    this.onChanged,
    this.onSubmitted,
    this.suffix,
  }) : super(key: key);

  final bool readOnly;
  final bool enabled;
  final TextEditingController? controller;
  final String? title;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      enabled: enabled,
      keyboardType: TextInputType.text,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: OffsetConst.s,
          horizontal: OffsetConst.m,
        ),
        border: const OutlineInputBorder(),
        hintText: title,
        labelText: title,
        suffixIcon: suffix,
      ),
    );
  }
}
