import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/controllers/bag_controller.dart';
import 'package:badges/badges.dart';
import 'package:webstore/screens/landing/home_page.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';

class NavBar extends StatelessWidget {
  final bool? mainPage;
  final ZoomDrawerController drawerController;
  const NavBar({Key? key, this.mainPage, required this.drawerController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: InkWell(
            onTap: () => Navigator.of(context).pushNamed("/shop"),
            child: SizedBox(
                height: 90,
                width: 150,
                child: Image.asset("assets/images/logo_vego.png")),
          ),
        ),
        MediaQuery.of(context).size.width >= largePageSize
            ? Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  IconButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed("/shopping-bag"),
                    icon: Badge(
                      badgeContent: GetX<BagController>(
                        builder: (_) =>
                            Text(bagController.products.length.toString()),
                      ),
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Color(0xFF7C8FB5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  IconButton(
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomePage(
                                    scrollInfo: true,
                                  ))),
                      icon: const Icon(
                        Icons.info_outline_rounded,
                        color: Color(0xFF7C8FB5),
                      )),
                  const SizedBox(
                    width: 25,
                  ),
                  IconButton(
                      onPressed: () {
                        drawerController.toggle!();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Color(0xFF45E994),
                      )),
                  const SizedBox(
                    width: 35,
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.only(right: 35.0),
                child: IconButton(
                  onPressed: () {
                    drawerController.toggle!();
                  },
                  icon: Badge(
                    badgeContent: GetX<BagController>(
                      builder: (_) =>
                          Text(bagController.products.length.toString()),
                    ),
                    child: const Icon(Icons.menu, color: Color(0xFF45E994)),
                  ),
                ),
              ),
      ],
    );
  }
}
