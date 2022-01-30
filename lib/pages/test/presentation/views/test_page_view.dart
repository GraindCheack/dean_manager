import 'package:dean_manager/common/constants/text_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class TestPageView extends StatelessWidget {
  const TestPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Hello world',
      style: TextStylesConst.m.copyWith(fontSize: 15.sp),
    );
  }
}
