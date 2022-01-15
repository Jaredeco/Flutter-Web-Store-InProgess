import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/controllers/bag_controller.dart';
import 'package:webstore/widgets/components/landing/gradient_text.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class MenuPage extends StatelessWidget {
  final ZoomDrawerController drawerController;
  const MenuPage({Key? key, required this.drawerController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    menuItem(context, Icons.home, "Domov", "/"),
                    menuItem(context, Icons.shop, "Obchod", "/shop"),
                    menuItem(
                        context, Icons.shopping_bag, "Košík", "/shopping-bag"),
                    menuItem(context, Icons.info, "O Nás", "/"),
                  ]),
            ),
          )),
    );
  }

  Widget menuItem(
      BuildContext context, IconData icon, String title, String route) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          selected: ModalRoute.of(context)!.settings.name == route,
          minLeadingWidth: 20,
          selectedTileColor: Colors.grey[100],
          leading: icon == Icons.shopping_bag
              ? Badge(
                  badgeContent: GetX<BagController>(
                    builder: (_) => Text(
                      bagController.products.length.toString(),
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: "Sora"),
                    ),
                  ),
                  child: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.black,
                  ),
                )
              : Icon(
                  icon,
                  color: Colors.black,
                ),
          title: Text(
            title,
            style: const TextStyle(
                fontSize: 16, color: Colors.black, fontFamily: "Sora"),
          ),
          onTap: () async {
            await Future(drawerController.toggle! as dynamic).then((value) {
              Navigator.of(context).pushNamed(route);
            });
          },
        ),
      ),
    );
  }
}
