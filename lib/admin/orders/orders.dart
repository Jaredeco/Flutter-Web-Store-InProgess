import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webstore/admin/orders/order_card.dart';
import 'package:webstore/controllers/admin_controller.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';

class AdminOrders extends StatefulWidget {
  const AdminOrders({Key? key}) : super(key: key);

  @override
  _AdminOrdersState createState() => _AdminOrdersState();
}

class _AdminOrdersState extends State<AdminOrders> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveUi(
      admin: true,
      largeWidgets: [
        Padding(
            padding: const EdgeInsets.all(20.0),
            child: GetX<AdminController>(builder: (AdminController controller) {
              if (controller != null && controller.orders != null) {
                return Column(
                  children: controller.orders
                      .map((item) => OrderCard(order: item))
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
