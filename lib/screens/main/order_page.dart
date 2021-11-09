import 'package:flutter/material.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/customWidgets/custom_button.dart';
import 'package:webstore/widgets/customWidgets/custom_textfield.dart';
import 'package:webstore/constants/controllers.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveUi(
      largeWidgets: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomTextField(
                txtController: orderController.nameTextController,
                txtIcon: Icons.person,
                txtText: "First Name"),
            CustomTextField(
                txtController: orderController.nameTextController,
                txtIcon: Icons.person,
                txtText: "Last Name"),
          ],
        ),
        Center(
          child: CustomTextField(
              txtController: orderController.nameTextController,
              txtIcon: Icons.person,
              txtText: "E-Mail"),
        ),
        Center(
            child: CustomButton(
                text: "Order",
                onTap: () {
                  print(bagController.products);
                })),
      ],
    );
  }
}
