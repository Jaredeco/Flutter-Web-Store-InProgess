import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/controllers/product_controller.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/components/home/product_card.dart';
import 'package:webstore/widgets/components/home/search_bar.dart';
import 'package:webstore/widgets/components/home/sort_drop_down.dart';
import 'package:webstore/widgets/components/landing/gradient_text.dart';
import 'package:webstore/widgets/components/landing/gradient_text_noanm.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> with TickerProviderStateMixin {
  final TextEditingController _searchTextController = TextEditingController();
  AnimationController? animationController;

  @override
  void initState() {
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
    return ResponsiveUi(
      largeWidgets: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const GradientText(
                  text: 'Objavte naše produkty...',
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 550),
                  child: const CustomText(
                    textAlign: TextAlign.center,
                    text:
                        "Introducing the comma three devkit. The comma three is 4th generation custom hardware designed to live in your car. It has dual cam 360° vision, plus a narrow cam to spot objects far off in the distance.",
                    size: 16,
                    color: Color(0xFF7C8FB5),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SearchBar(
                      onChanged: (text) {
                        productController.search(text);
                      },
                      txtController: _searchTextController,
                    ),
                    const SizedBox(width: 10),
                    GetX<ProductController>(
                      builder: (_) => SortDropDown(
                        width: 250,
                        cValue: productController.orderBy.value,
                        ddItems: ProductController.orderBys,
                        onChanged: (newValue) {
                          animationController!.reset();
                          productController.setOrderBy(newValue.toString());
                          productController.onInit();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
            padding: const EdgeInsets.all(20.0),
            child: GetX<ProductController>(
                builder: (ProductController controller) {
              if (controller != null && controller.products != null) {
                return Wrap(
                  alignment: WrapAlignment.center,
                  children: controller.query.isEmpty
                      ? controller.products
                          .map((item) {
                            animationController!.forward();
                            return ProductCard(
                              product: item,
                              animationController: animationController,
                              animation: Tween<double>(begin: 0.0, end: 1.0)
                                  .animate(CurvedAnimation(
                                      parent: animationController!,
                                      curve: Interval(
                                          (1 / controller.products.length) *
                                              controller.products.indexOf(item),
                                          1.0,
                                          curve: Curves.fastOutSlowIn))),
                            );
                          })
                          .toList()
                          .cast<Widget>()
                      : controller.searchProducts(animationController!),
                );
              } else {
                return Container();
              }
            }))
      ],
      smallWidgets: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const GradientTextNoAnm(
                  text: 'Objavte naše produkty...',
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  width: 500,
                  child: CustomText(
                    textAlign: TextAlign.center,
                    text:
                        "Introducing the comma three devkit. The comma three is 4th generation custom hardware designed to live in your car. It has dual cam 360° vision, plus a narrow cam to spot objects far off in the distance.",
                    size: 16,
                    color: Color(0xFF7C8FB5),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SearchBar(
                  onChanged: (text) {
                    productController.search(text);
                  },
                  txtController: _searchTextController,
                ),
                const SizedBox(height: 10),
                GetX<ProductController>(
                  builder: (_) => SortDropDown(
                    width: 250,
                    cValue: productController.orderBy.value,
                    ddItems: ProductController.orderBys,
                    onChanged: (newValue) {
                      animationController!.reset();
                      productController.setOrderBy(newValue.toString());
                      productController.onInit();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
            padding: const EdgeInsets.all(20.0),
            child: GetX<ProductController>(
                builder: (ProductController controller) {
              if (controller != null && controller.products != null) {
                return Wrap(
                  alignment: WrapAlignment.center,
                  children: controller.query.isEmpty
                      ? controller.products
                          .map((item) {
                            animationController!.forward();
                            return ProductCard(
                              product: item,
                              animationController: animationController,
                              animation: Tween<double>(begin: 0.0, end: 1.0)
                                  .animate(CurvedAnimation(
                                      parent: animationController!,
                                      curve: Interval(
                                          (1 / controller.products.length) *
                                              controller.products.indexOf(item),
                                          1.0,
                                          curve: Curves.fastOutSlowIn))),
                            );
                          })
                          .toList()
                          .cast<Widget>()
                      : controller.searchProducts(animationController!),
                );
              } else {
                return Container();
              }
            }))
      ],
    );
  }
}







        // CustomTextField(
            //   onChanged: (text) {
            //     productController.search(text);
            //   },
            //   txtController: _searchTextController,
            //   txtIcon: Icons.search,
            //   txtText: "Search...",
            //   maxLines: true,
            //   width: MediaQuery.of(context).size.width * 0.5,
            // ),











// double spaceBetween = 0.0;
//   final _duration = const Duration(milliseconds: 500);

//   _onStartScroll(ScrollMetrics metrics) {}

//   _onUpdateScroll(ScrollMetrics metrics) {
//     if (spaceBetween == 30.0) return;
//     setState(() {
//       spaceBetween = 20.0;
//     });
//   }

//   _onEndScroll(ScrollMetrics metrics) async {
//     await Future.delayed(_duration);
//     setState(() {
//       spaceBetween = 10.0;
//     });
//   }