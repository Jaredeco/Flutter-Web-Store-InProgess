import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/controllers/product_controller.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/components/home/product_card.dart';

class AdminProducts extends StatefulWidget {
  const AdminProducts({Key? key}) : super(key: key);

  @override
  _AdminProductsState createState() => _AdminProductsState();
}

class _AdminProductsState extends State<AdminProducts> {
  @override
  void initState() {
    super.initState();
    if (!adminController.loggedIn.value) {
      SystemNavigator.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveUi(
      admin: true,
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
                            admin: true,
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
