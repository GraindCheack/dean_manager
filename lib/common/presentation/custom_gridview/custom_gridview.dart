import 'package:dean_manager/common/constants/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    Key? key,
    required this.columnRatio,
    required this.children,
  }) : super(key: key);
  final int columnRatio;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      mainAxisSpacing: OffsetConst.m,
      crossAxisSpacing: OffsetConst.m,
      primary: false,
      crossAxisCount: 12,
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
      staggeredTileBuilder: (index) => StaggeredTile.fit(columnRatio),
    );
  }
}
