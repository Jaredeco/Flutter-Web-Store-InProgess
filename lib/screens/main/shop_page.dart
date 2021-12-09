import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/controllers/product_controller.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/components/home/product_card.dart';
import 'package:webstore/widgets/customWidgets/custom_drop_down.dart';
import 'package:webstore/widgets/customWidgets/custom_textfield.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final TextEditingController _searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ResponsiveUi(
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
            GetX<ProductController>(
              builder: (_) => CustomDropDown(
                width: MediaQuery.of(context).size.width * 0.25,
                cValue: productController.orderBy.value,
                ddItems: ProductController.orderBys,
                onChanged: (newValue) {
                  productController.setOrderBy(newValue.toString());
                  productController.onInit();
                },
              ),
            )
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
                          .map((item) => ProductCard(
                                product: item,
                              ))
                          .toList()
                          .cast<Widget>()
                      : controller.searchProducts(),
                );
              } else {
                return Container();
              }
            })),
      ],
    );
  }
}
