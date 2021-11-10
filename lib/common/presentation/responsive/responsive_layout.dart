import 'package:flutter/cupertino.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key? key,
    required this.config,
    required this.byDefault,
  }) : super(key: key);

  final Map<int, Widget> config;
  final Widget byDefault;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, dimens) {
      final widthKeys = config.keys.toList()..sort();
      final showConfigKey = widthKeys.firstWhere(
        (e) => dimens.maxWidth <= e,
        orElse: () => -1,
      );
      return config[showConfigKey] ?? byDefault;
    });
  }
}
