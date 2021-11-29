import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/controllers/bag_controller.dart';
import 'package:badges/badges.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

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
              onTap: () => Navigator.of(context).pushNamed("/shop"),
              child: SizedBox(
                  height: 90,
                  width: 150,
                  child: Image.asset("assets/images/logo_vego.png")),
            ),
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
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
                  child: const Icon(Icons.shopping_bag_outlined),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.info_outline)),
              const SizedBox(
                width: 35,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
