import 'package:dean_manager/application.dart';
import 'package:dean_manager/common/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await initServices();
  runApp(const MyApp());
}

Future<void> initServices() async {
  await Get.putAsync(() => DbService().init());
}
