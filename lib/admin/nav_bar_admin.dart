import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';

class AdminNavBar extends StatelessWidget {
  final ZoomDrawerController drawerController;
  const AdminNavBar({Key? key, required this.drawerController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: InkWell(
              onTap: () => Navigator.of(context).pushNamed('/admin/orders'),
              child: SizedBox(
                  height: 90,
                  width: 150,
                  child: Image.asset("assets/images/admin.png")),
            ),
          ),
          MediaQuery.of(context).size.width >= largePageSize
              ? Row(
                  children: [
                    IconButton(
                        onPressed: () => Navigator.of(context)
                            .pushNamed('/admin/create-product'),
                        icon: const Icon(Icons.add)),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/admin/products'),
                      icon: const Icon(Icons.shop),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: () {
                        adminController.changelogIn(false);
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/shop', (route) => false);
                      },
                      icon: const Icon(
                        Icons.exit_to_app,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(width: 35),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.only(right: 35.0),
                  child: IconButton(
                      onPressed: () {
                        drawerController.toggle!();
                      },
                      icon: const Icon(Icons.menu)),
                ),
        ],
      ),
    );
  }
}
