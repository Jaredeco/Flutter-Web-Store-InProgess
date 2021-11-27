import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webstore/controllers/bag_controller.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/screens/main/order_page.dart';
import 'package:webstore/widgets/components/shopping_bag/shopping_bag_item.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/widgets/customWidgets/custom_button.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class ShoppingBag extends StatefulWidget {
  const ShoppingBag({Key? key}) : super(key: key);

  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ResponsiveUi(
            largeWidgets: [
              bagController.products.isEmpty
                  ? const Center(
                      child: Icon(
                      Icons.remove_shopping_cart,
                      size: 100,
                    ))
                  : GetX<BagController>(
                      builder: (_) => Column(
                        children: List<Widget>.generate(
                            bagController.products.length,
                            (index) => BagItem(
                                product: bagController.products.keys
                                    .elementAt(index))),
                      ),
                    ),
            ],
          ),
        ),
        Material(
          child: SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GetX<BagController>(
                  builder: (_) => CustomText(
                    padding: const EdgeInsets.only(left: 40),
                    text: "Total: ${bagController.totalAmount} \$",
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 25, 40, 25),
                  child: CustomButton(
                    text: "Checkout",
                    txtSize: 15,
                    onTap: () {
                      if (bagController.products.isNotEmpty) {
                        Navigator.of(context).pushNamed('/order');
                      } else {
                        Get.snackbar("Empty shopping bag!",
                            "Please add items to your shopping bag to continue.",
                            backgroundColor: Colors.white,
                            margin: const EdgeInsets.all(20),
                            duration: const Duration(seconds: 2),
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    },
                    bgColor: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
