import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/controllers/bag_controller.dart';

class MenuPage extends StatelessWidget {
  final ZoomDrawerController drawerController;
  const MenuPage({Key? key, required this.drawerController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
          backgroundColor: Color(0xFFF67C0B9),
          body: Container(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    menuItem(context, Icons.home, "Home", "/"),
                    menuItem(context, Icons.shop, "Shop", "/shop"),
                    menuItem(context, Icons.shopping_bag, "Shopping Bag",
                        "/shopping-bag"),
                    menuItem(context, Icons.info, "About Us", "/"),
                  ]),
            ),
          )),
    );
  }

  Widget menuItem(
      BuildContext context, IconData icon, String title, String route) {
    return ListTile(
      selected: ModalRoute.of(context)!.settings.name == route,
      minLeadingWidth: 20,
      leading: icon == Icons.shopping_bag
          ? Badge(
              badgeContent: GetX<BagController>(
                builder: (_) => Text(bagController.products.length.toString()),
              ),
              child: const Icon(Icons.shopping_bag_outlined),
            )
          : Icon(icon),
      title: Text(
        title,
      ),
      onTap: () async {
        await Future(drawerController.toggle! as dynamic).then((value) {
          Navigator.of(context).pushNamed(route);
        });
      },
    );
  }
}
