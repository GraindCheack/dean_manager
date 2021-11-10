import 'package:dean_manager/common/presentation/page_menu_wrapper/page_menu_wrapper_view.dart';
import 'package:dean_manager/pages/main/bindings/main_bindings.dart';
import 'package:dean_manager/pages/main/presentation/views/main_page_view.dart';
import 'package:dean_manager/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = AppRoutes.main;

  static final routes = [
    GetPage(
      name: AppRoutes.main,
      page: () => const PageMenuWrapperView(child: MainView()),
      binding: MainBindings(),
    ),
  ];
}
