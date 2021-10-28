import 'package:flutter/material.dart';
import 'package:webstore/widgets/components/base/nav_bar.dart';

class BaseSmall extends StatelessWidget {
  final List<Widget> widgets;
  const BaseSmall({Key? key, required this.widgets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const NavBar(),
          ...widgets,
        ],
      ),
    );
  }
}
