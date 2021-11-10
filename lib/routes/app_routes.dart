abstract class AppRoutes {
  static const main = '/main';
  static const dean = 'dean';
}

abstract class AppFullRoutes {
  static const main = '/main';
  static const dean = '${AppRoutes.main}/dean';
}
