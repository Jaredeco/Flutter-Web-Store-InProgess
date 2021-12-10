import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:webstore/admin/menu_page_admin.dart';
import 'package:webstore/admin/nav_bar_admin.dart';
import 'package:webstore/screens/helper/menu_page.dart';
import 'package:webstore/widgets/components/base/nav_bar.dart';

class BaseLarge extends StatefulWidget {
  final List<Widget> widgets;
  final bool? admin;
  final bool? mainPage;
  const BaseLarge({Key? key, required this.widgets, this.admin, this.mainPage})
      : super(key: key);

  @override
  State<BaseLarge> createState() => _BaseLargeState();
}

class _BaseLargeState extends State<BaseLarge> {
  final _drawerController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        isRtl: true,
        controller: _drawerController,
        style: DrawerStyle.Style1,
        menuScreen: widget.admin != null
            ? AdminMenuPage(drawerController: _drawerController)
            : MenuPage(
                drawerController: _drawerController,
              ),
        mainScreen: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              widget.admin != null
                  ? AdminNavBar(drawerController: _drawerController)
                  : NavBar(
                      mainPage: widget.mainPage,
                      drawerController: _drawerController,
                    ),
              ...widget.widgets,
            ],
          ),
        ),
        borderRadius: 24.0,
        showShadow: true,
        angle: -12.0,
        backgroundColor: Colors.grey,
        slideWidth: MediaQuery.of(context).size.width * 0.3,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
      ),
    );
  }
}
