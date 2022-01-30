abstract class AppRoutes {
  static const main = '/main';
  static const test = '/test';
  static const dean = 'dean';
}

abstract class AppFullRoutes {
  static const main = '/main';
  static const test = '/test';
  static const dean = '${AppRoutes.main}/dean';
}
