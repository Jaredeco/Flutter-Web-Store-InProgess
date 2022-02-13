import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:webstore/controllers/bag_controller.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/components/shopping_bag/shopping_bag_item.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/widgets/components/shopping_bag/shopping_bag_item_small.dart';
import 'package:webstore/widgets/customWidgets/custom_button.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class ShoppingBag extends StatefulWidget {
  const ShoppingBag({Key? key}) : super(key: key);

  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ResponsiveUi(
            largeWidgets: [
              GetX<BagController>(
                builder: (BagController controller) => bagController
                        .products.isEmpty
                    ? const Center(
                        child: Icon(
                        Icons.remove_shopping_cart,
                        size: 100,
                      ))
                    : Column(
                        children: List<Widget>.generate(
                            bagController.products.length, (index) {
                          animationController!.forward();
                          if (MediaQuery.of(context).size.width >=
                              largePageSize) {
                            return BagItem(
                              product: bagController.products.keys
                                  .elementAt(index)
                                  .product,
                              option: bagController.products.keys
                                  .elementAt(index)
                                  .productOption,
                              animationController: animationController,
                              animation: Tween<double>(begin: 0.0, end: 1.0)
                                  .animate(CurvedAnimation(
                                      parent: animationController!,
                                      curve: Interval(
                                          (1 / controller.products.length) *
                                              index,
                                          1.0,
                                          curve: Curves.easeOutExpo))),
                            );
                          }
                          return BagItemSmall(
                            product:
                                bagController.products.keys.elementAt(index).product,
                            option:
                                bagController.products.keys.elementAt(index).productOption,
                            animationController: animationController,
                            animation: Tween<double>(begin: 0.0, end: 1.0)
                                .animate(CurvedAnimation(
                                    parent: animationController!,
                                    curve: Interval(
                                        (1 / controller.products.length) *
                                            index,
                                        1.0,
                                        curve: Curves.fastOutSlowIn))),
                          );
                        }),
                      ),
              ),
            ],
          ),
        ),
        Material(
          color: Colors.white,
          child: SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GetX<BagController>(
                  builder: (_) => Expanded(
                    child: CustomText(
                      padding: const EdgeInsets.only(left: 40),
                      text: "Suma: ${bagController.totalAmount} €",
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 25, 40, 25),
                  child: CustomButton(
                    text: "Pokladňa",
                    onTap: () {
                      if (bagController.products.isNotEmpty) {
                        Navigator.of(context).pushNamed('/order');
                      } else {
                        showTopSnackBar(
                          context,
                          const CustomSnackBar.error(
                            message: "Košík je prázdny!",
                          ),
                        );
                      }
                    },
                    bgColor: Colors.black,
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
