import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/controllers/bag_controller.dart';
import 'package:webstore/screens/main/home_page.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';
import 'package:webstore/screens/main/favorite_page.dart';
import 'package:webstore/screens/main/shopping_bag.dart';
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
          Row(
            children: [
              const SizedBox(width: 35),
              InkWell(
                onTap: () {},
                child: const CustomText(
                  text: "Men",
                ),
              ),
              const SizedBox(width: 20),
              InkWell(
                onTap: () {},
                child: const CustomText(
                  text: "Women",
                ),
              ),
              const SizedBox(width: 20),
              InkWell(
                onTap: () {},
                child: const CustomText(
                  text: "Kids",
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
          InkWell(
            onTap: () => Get.to(() => const HomePage()),
            child: SizedBox(
                height: 90,
                width: 150,
                child: Image.asset("assets/images/main_logo.png")),
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                  onPressed: () => Get.to(() => const FavoritePage()),
                  icon: const Icon(Icons.favorite_outline)),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () => Get.to(() => const ShoppingBag()),
                icon: Badge(
                  badgeContent: GetX<BagController>(
                    builder: (_) =>
                        Text(bagController.products.length.toString()),
                  ),
                  child: const Icon(Icons.shopping_bag_outlined),
                ),
              ),
              const SizedBox(width: 35),
            ],
          ),
        ],
      ),
    );
  }
}
