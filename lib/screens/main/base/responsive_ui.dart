import 'package:flutter/material.dart';
import 'base_large.dart';
import 'base_small.dart';

const int largePageSize = 1400;

class ResponsiveUi extends StatelessWidget {
  final List<Widget>? smallWidgets;
  final List<Widget> largeWidgets;
  final bool? admin;
  final bool? landing;
  final bool? mainPage;
  const ResponsiveUi(
      {Key? key,
      required this.largeWidgets,
      this.smallWidgets,
      this.admin,
      this.mainPage,
      this.landing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double _width = constraints.maxWidth;
      if (_width >= largePageSize) {
        return BaseLarge(
          widgets: largeWidgets,
          admin: admin,
          mainPage: mainPage,
          landing: landing,
        );
      } else {
        return smallWidgets != null
            ? BaseSmall(
                widgets: smallWidgets!,
                admin: admin,
                mainPage: mainPage,
                landing: landing)
            : BaseLarge(
                widgets: largeWidgets,
                admin: admin,
                mainPage: mainPage,
                landing: landing,
              );
      }
    });
  }
}
