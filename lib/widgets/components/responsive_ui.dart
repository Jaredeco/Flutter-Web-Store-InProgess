import 'package:flutter/material.dart';

const int largePageSize = 700;

class ResponsiveUi extends StatelessWidget {
  final Widget largePage;
  final Widget? smallPage;
  const ResponsiveUi({
    Key? key,
    required this.largePage,
    this.smallPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double _width = constraints.maxWidth;
      if (_width >= largePageSize) {
        return largePage;
      } else {
        return smallPage ?? largePage;
      }
    });
  }
}
