import 'package:dean_manager/common/constants/size_constants.dart';
import 'package:dean_manager/common/presentation/custom_gridview/custom_gridview.dart';
import 'package:dean_manager/common/presentation/responsive/responsive_layout.dart';
import 'package:dean_manager/pages/main/presentation/controllers/main_controller.dart';
import 'package:dean_manager/pages/main/presentation/views/main_groups_view.dart';
import 'package:dean_manager/pages/main/presentation/views/main_students_view.dart';
import 'package:dean_manager/pages/main/presentation/views/main_teachers_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);
  static const _gridItems = <Widget>[
    MainGroupsView(),
    MainTeachersView(),
    MainStudentsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(OffsetConst.m),
      child: const ResponsiveLayout(
        config: {
          1000: CustomGridView(columnRatio: 6, children: _gridItems),
          600: CustomGridView(columnRatio: 12, children: _gridItems),
        },
        byDefault: CustomGridView(columnRatio: 4, children: _gridItems),
      ),
    );
  }
}
