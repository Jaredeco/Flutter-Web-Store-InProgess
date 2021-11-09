import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webstore/controllers/product_controller.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/components/home/product_card.dart';
import 'package:webstore/constants/controllers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveUi(
      largeWidgets: [
        Padding(
            padding: const EdgeInsets.all(20.0),
            child: GetX(
                init: Get.put(ProductController()),
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
