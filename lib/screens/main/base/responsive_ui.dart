import 'package:flutter/material.dart';
import 'base_large.dart';
import 'base_small.dart';

const int largePageSize = 700;

class ResponsiveUi extends StatelessWidget {
  final List<Widget>? smallWidgets;
  final List<Widget> largeWidgets;
  final bool? admin;
  const ResponsiveUi({
    Key? key,
    required this.largeWidgets,
    this.smallWidgets,
    this.admin
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double _width = constraints.maxWidth;
      if (_width >= largePageSize) {
        return BaseLarge(widgets: largeWidgets, admin: admin,);
      } else {
        return smallWidgets != null
            ? BaseSmall(widgets: smallWidgets!, admin: admin)
            : BaseLarge(widgets: largeWidgets, admin: admin);
      }
    });
  }
}
