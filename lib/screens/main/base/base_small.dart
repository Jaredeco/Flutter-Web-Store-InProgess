import 'package:flutter/material.dart';
import 'package:webstore/admin/nav_bar_admin.dart';
import 'package:webstore/widgets/components/base/nav_bar.dart';

class BaseSmall extends StatelessWidget {
  final List<Widget> widgets;
  final bool? admin;
  const BaseSmall({Key? key, required this.widgets, this.admin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          admin != null ? const AdminNavBar() : const NavBar(),
          ...widgets,
        ],
      ),
    );
  }
}
