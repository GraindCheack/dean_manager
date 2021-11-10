import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageMenuWrapperView extends StatelessWidget {
  final Widget child;
  const PageMenuWrapperView({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: SafeArea(
        child: child,
      ),
    );
  }
}
