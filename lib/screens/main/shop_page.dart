import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/controllers/product_controller.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/components/home/product_card.dart';
import 'package:webstore/widgets/components/home/sort_drop_down.dart';
import 'package:webstore/widgets/customWidgets/custom_drop_down.dart';
import 'package:webstore/widgets/customWidgets/custom_textfield.dart';

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
    return NotificationListener<ScrollNotification>(
        // onNotification: (scrollNotification) {
        //   if (scrollNotification is ScrollStartNotification) {
        //     _onStartScroll(scrollNotification.metrics);
        //   } else if (scrollNotification is ScrollUpdateNotification) {
        //     _onUpdateScroll(scrollNotification.metrics);
        //   } else if (scrollNotification is ScrollEndNotification) {
        //     _onEndScroll(scrollNotification.metrics);
        //   }
        //   return true;
        // },
        child: ResponsiveUi(
      mainPage: true,
      largeWidgets: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomTextField(
              onChanged: (text) {
                productController.search(text);
              },
              txtController: _searchTextController,
              txtIcon: Icons.search,
              txtText: "Search...",
              maxLines: true,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            // GetX<ProductController>(
            //   builder: (_) => SortDropDown(
            //     width: MediaQuery.of(context).size.width * 0.25,
            //     cValue: productController.orderBy.value,
            //     ddItems: ProductController.orderBys,
            //     onChanged: (newValue) {
            //       animationController!.reset();
            //       productController.setOrderBy(newValue.toString());
            //       productController.onInit();
            //     },
            //   ),
            // )
            SimpleAccountMenu(
              icons: const [
                Icon(Icons.date_range),
                Icon(Icons.arrow_upward_rounded),
                Icon(Icons.arrow_downward_rounded),
              ],
              iconColor: Colors.white,
              onChange: (index) {
                print(index);
              },
            ),
          ],
        ),
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
    ));
  }
}



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