import 'package:dean_manager/common/constants/size_constants.dart';
import 'package:flutter/cupertino.dart';

class DeanOffset extends StatelessWidget {
  final double width;
  final double height;

  const DeanOffset({
    Key? key,
    this.width = OffsetConst.m,
    this.height = OffsetConst.m,
  }) : super(key: key);

  const DeanOffset.vertical([
    this.height = OffsetConst.m,
    this.width = 0,
    Key? key,
  ]) : super(key: key);

  const DeanOffset.horizontal([
    this.width = OffsetConst.m,
    this.height = 0,
    key,
  ]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}
