import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webstore/controllers/product_controller.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/components/home/product_card.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveUi(
      largeWidgets: [
        Padding(
            padding: const EdgeInsets.all(20.0),
            child: GetX<ProductController>(
                builder: (ProductController controller) {
                  if (controller != null && controller.products != null) {
                    return Wrap(
                      alignment: WrapAlignment.center,
                      children: controller.products
                          .map((item) => ProductCard(
                                product: item,
                              ))
                          .toList()
                          .cast<Widget>(),
                    );
                  } else {
                    return Container();
                  }
                })),
      ],
    );
  }
}
