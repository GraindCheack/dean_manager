import 'package:dean_manager/common/presentation/custom_input/custom_input_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    Key? key,
    required this.title,
    this.height = CustomInputConfig.height,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.width,
    this.suffix,
  }) : super(key: key);

  final double height;
  final String title;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final double? width;
  final Widget? suffix;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      controller: controller,
      decoration: CustomInputConfig.getDecoration(
        title: title,
        suffix: suffix,
      ),
    );
  }
}
