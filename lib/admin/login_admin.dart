import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/customWidgets/custom_button.dart';
import 'package:webstore/widgets/customWidgets/custom_textfield.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  void initState() {
    adminController.getLoginCredentials();
    super.initState();
  }

  final TextEditingController _admin = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: ResponsiveUi(
        largeWidgets: [
          Center(
            child: CustomTextField(
              txtController: _admin,
              txtIcon: Icons.person,
              txtText: "Admin",
              maxLines: true,
            ),
          ),
          Center(
            child: CustomTextField(
              txtController: _password,
              txtIcon: Icons.lock,
              txtText: "Password",
              isObscure: true,
              maxLines: true,
            ),
          ),
        ],
      )),
      Material(
        color: Colors.white,
        child: SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 40, 25),
                child: CustomButton(
                  bgColor: Colors.black,
                    text: "Log In",
                    onTap: () {
                      if (_admin.text == adminController.adminLogin &&
                          _password.text == adminController.adminPassword) {
                        adminController.changelogIn(true);
                        Navigator.of(context).pushNamed("/admin/orders");
                      } else {
                        showTopSnackBar(
                          context,
                          const CustomSnackBar.error(
                            message:
                                "Invalid e-mail or password! Please try again.",
                          ),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
