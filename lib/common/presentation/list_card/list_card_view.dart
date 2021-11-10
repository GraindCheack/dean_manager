import 'package:dean_manager/common/constants/border_constants.dart';
import 'package:dean_manager/common/constants/size_constants.dart';
import 'package:flutter/cupertino.dart';

class DeanListCard extends StatelessWidget {
  const DeanListCard(
    this.text, {
    this.icon,
    this.color,
    Key? key,
  }) : super(key: key);

  final Icon? icon;
  final Color? color;
  final String text;

  static const double _height = 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text, overflow: TextOverflow.fade, maxLines: 1),
      height: _height,
      padding: const EdgeInsets.all(OffsetConst.s),
      decoration: BoxDecoration(
        borderRadius: BorderConst.getCircleRadius(_height),
      ),
    );
  }
}
