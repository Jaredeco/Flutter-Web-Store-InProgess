import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webstore/admin/products/product_card_admin.dart';
import 'package:webstore/controllers/bag_controller.dart';
import 'package:webstore/controllers/order_controller.dart';
import 'package:webstore/models/bag_item_model.dart';
import 'package:webstore/models/order_model.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/components/home/product_card.dart';
import 'package:webstore/widgets/components/landing/gradient_text.dart';
import 'package:webstore/widgets/customWidgets/custom_button.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:get/get.dart';

class SummaryPage extends StatefulWidget {
  final OrderModel order;
  final Map<BagItemModel, int> bagProducts;
  const SummaryPage({Key? key, required this.order, required this.bagProducts})
      : super(key: key);

  @override
  State<SummaryPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<SummaryPage> with TickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    if (bagController.products.isEmpty) {
      SystemNavigator.pop();
    }

    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
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
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () => Navigator.of(context).pop(),
                child: SizedBox(
                  width: 100,
                  height: 50,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Icon(
                            Icons.edit,
                            color: Color(0xFF45E994),
                          ),
                        ),
                        CustomText(
                          text: "Upraviť Údaje",
                          size: 16,
                          color: Color(0xFF45E994),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const CustomText(
                color: Color(0xFF7C8FB5),
                textAlign: TextAlign.center,
                text: "Zhrnutie vašej objednávky",
                size: 40,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        summaryItem("Meno", widget.order.firstName!, false),
                        summaryItem("Priezvisko", widget.order.surname!, false),
                        summaryItem("Mesto", widget.order.city!, false),
                        summaryItem("PSČ", widget.order.psc!, false),
                        summaryItem("Ulica", widget.order.street!, false),
                        summaryItem("Krajina", widget.order.country!, false),
                        summaryItem("E-Mail", widget.order.email!, false),
                        summaryItem(
                            "Telefónne Číslo", widget.order.phone!, false),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: GetX<OrderController>(
                              builder: (OrderController controller) {
                            if (controller != null &&
                                controller.orderedProducts != null) {
                              return Wrap(
                                alignment: WrapAlignment.center,
                                children: List.generate(
                                    widget.bagProducts.length, (index) {
                                  animationController!.forward();
                                  return ProductCard(
                                    product: widget.bagProducts.keys
                                        .toList()[index]
                                        .product!,
                                    animationController: animationController,
                                    animation: Tween<double>(
                                            begin: 0.0, end: 1.0)
                                        .animate(CurvedAnimation(
                                            parent: animationController!,
                                            curve: Interval(
                                                (1 /
                                                        widget.bagProducts.keys
                                                            .length) *
                                                    index,
                                                1.0,
                                                curve: Curves.fastOutSlowIn))),
                                    amount: widget.bagProducts.values
                                        .toList()[index],
                                    option: widget.bagProducts.keys
                                        .toList()[index]
                                        .productOption!,
                                  );
                                }),
                              );
                            } else {
                              return Container();
                            }
                          }),
                        )),
                  ],
                ),
              ),
            ],
            smallWidgets: [
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () => Navigator.of(context).pop(),
                child: SizedBox(
                  width: 100,
                  height: 50,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Icon(
                            Icons.edit,
                            color: Color(0xFF45E994),
                          ),
                        ),
                        CustomText(
                          text: "Upraviť Údaje",
                          size: 16,
                          color: Color(0xFF45E994),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const CustomText(
                color: Color(0xFF7C8FB5),
                textAlign: TextAlign.center,
                text: "Zhrnutie vašej objednávky",
                size: 40,
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  summaryItem("Meno", widget.order.firstName!, true),
                  summaryItem("Priezvisko", widget.order.surname!, true),
                  summaryItem("Mesto", widget.order.city!, true),
                  summaryItem("PSČ", widget.order.psc!, true),
                  summaryItem("Ulica", widget.order.street!, true),
                  summaryItem("Krajina", widget.order.country!, true),
                  summaryItem("E-Mail", widget.order.email!, true),
                  summaryItem("Telefónne Číslo", widget.order.phone!, true),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: GetX<OrderController>(
                        builder: (OrderController controller) {
                      if (controller != null &&
                          controller.orderedProducts != null) {
                        return Wrap(
                          alignment: WrapAlignment.center,
                          children:
                              List.generate(widget.bagProducts.length, (index) {
                            animationController!.forward();
                            return ProductCard(
                              product: widget.bagProducts.keys
                                  .toList()[index]
                                  .product!,
                              animationController: animationController,
                              animation: Tween<double>(begin: 0.0, end: 1.0)
                                  .animate(CurvedAnimation(
                                      parent: animationController!,
                                      curve: Interval(
                                          (1 / widget.bagProducts.keys.length) *
                                              index,
                                          1.0,
                                          curve: Curves.fastOutSlowIn))),
                              amount: widget.bagProducts.values.toList()[index],
                              option: widget.bagProducts.keys
                                  .toList()[index]
                                  .productOption!,
                            );
                          }),
                        );
                      } else {
                        return Container();
                      }
                    }),
                  )),
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
                      color: const Color(0xFF7C8FB5),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 25, 40, 25),
                  child: GetX<OrderController>(
                    builder: (_) => orderController.isLoading.value
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            text: "Objednať",
                            onTap: () {
                              print(widget.order.bagProducts);
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.INFO,
                                animType: AnimType.BOTTOMSLIDE,
                                title: 'Objednať?',
                                desc: 'Objednať s povinnosťou platby',
                                btnOkText: "Objednať",
                                btnCancelOnPress: () {},
                                btnOkOnPress: () async {
                                  orderController.loading(true);
                                  orderController.createOrder(widget.order);
                                  bagController.emptyBag();
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/thankyou',
                                      (Route<dynamic> route) => false);
                                  orderController.loading(false);
                                },
                              ).show();
                            },
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget summaryItem(String title, String data, bool cen) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment:
          cen ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        CustomText(
          textAlign: TextAlign.center,
          text: title,
          size: 20,
          color: const Color(0xFF45E994),
        ),
        const SizedBox(
          height: 3,
        ),
        CustomText(
          textAlign: TextAlign.center,
          text: data,
          size: 13,
          color: const Color(0xFF7C8FB5),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
