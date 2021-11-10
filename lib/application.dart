import 'package:dean_manager/common/theme/app_theme.dart';
import 'package:dean_manager/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
      theme: appTheme,
    );
  }
}
