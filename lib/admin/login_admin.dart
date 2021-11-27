import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webstore/admin/products/create_product.dart';
import 'package:webstore/admin/products/products.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/customWidgets/custom_button.dart';
import 'package:webstore/widgets/customWidgets/custom_textfield.dart';

class Admin extends StatelessWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _ADMIN = "admin";
    String _PASSWORD = "admin";
    TextEditingController _admin = TextEditingController();
    TextEditingController _password = TextEditingController();
    return ResponsiveUi(
      largeWidgets: [
        Center(
          child: CustomTextField(
              txtController: _admin, txtIcon: Icons.person, txtText: "Admin"),
        ),
        Center(
          child: CustomTextField(
              txtController: _password,
              txtIcon: Icons.lock,
              txtText: "Password"),
        ),
        const SizedBox(height: 20),
        Center(
            child: CustomButton(
                text: "Log In",
                onTap: () {
                  if (_admin.text == _ADMIN && _password.text == _PASSWORD) {}
                })),
      ],
    );
  }
}
