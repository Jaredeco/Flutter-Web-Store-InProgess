import 'package:flutter/material.dart';
import 'base_large.dart';
import 'base_small.dart';

const int largePageSize = 700;

class ResponsiveUi extends StatelessWidget {
  final List<Widget>? smallWidgets;
  final List<Widget> largeWidgets;
  const ResponsiveUi({
    Key? key,
    required this.largeWidgets,
    this.smallWidgets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double _width = constraints.maxWidth;
      if (_width >= largePageSize) {
        return BaseLarge(widgets: largeWidgets);
      } else {
        return smallWidgets != null
            ? BaseSmall(widgets: smallWidgets!)
            : BaseLarge(widgets: largeWidgets);
      }
    });
  }
}
