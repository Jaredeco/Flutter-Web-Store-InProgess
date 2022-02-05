import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webstore/controllers/bag_controller.dart';
import 'package:webstore/controllers/order_controller.dart';
import 'package:webstore/models/order_model.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/customWidgets/custom_button.dart';
import 'package:webstore/widgets/customWidgets/custom_drop_down.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';
import 'package:webstore/widgets/customWidgets/custom_textfield.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:get/get.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    if (bagController.products.isEmpty) {
      SystemNavigator.pop();
    }
    super.initState();
  }

  final TextEditingController _firstNameTextController =
      TextEditingController();
  final TextEditingController _surnameTextController = TextEditingController();
  final TextEditingController _cityTextController = TextEditingController();
  final TextEditingController _streetTextController = TextEditingController();
  final TextEditingController _pscTextController = TextEditingController();
  final TextEditingController _phoneTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: ResponsiveUi(
              largeWidgets: [
                Center(
                  child: Column(children: [
                    CustomTextField(
                      maxLines: true,
                      txtController: _firstNameTextController,
                      txtIcon: Icons.person,
                      txtText: "Krstné Meno",
                      validate: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Text je prázdny!';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      maxLines: true,
                      txtController: _surnameTextController,
                      txtIcon: Icons.person,
                      txtText: "Priezvisko",
                      validate: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Text je prázdny!';
                        }
                        return null;
                      },
                    ),
                    Center(
                      child: CustomTextField(
                        maxLines: true,
                        txtController: _cityTextController,
                        txtIcon: Icons.location_city,
                        txtText: "Mesto",
                        validate: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Text je prázdny!';
                          }
                          return null;
                        },
                      ),
                    ),
                    CustomTextField(
                      maxLines: true,
                      txtController: _pscTextController,
                      txtIcon: Icons.location_city,
                      txtText: "PSČ",
                      validate: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Text je prázdny!';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      maxLines: true,
                      txtController: _streetTextController,
                      txtIcon: Icons.streetview,
                      txtText: "Ulica",
                      validate: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Text je prázdny!';
                        }
                        return null;
                      },
                    ),
                    Center(
                        child: GetX<OrderController>(
                      builder: (_) => CustomDropDown(
                        cValue: orderController.country.value,
                        ddItems: OrderController.selectCountries,
                        onChanged: (newValue) {
                          orderController.setCountry(newValue.toString());
                        },
                      ),
                    )),
                    CustomTextField(
                      maxLines: true,
                      txtController: _emailTextController,
                      txtIcon: Icons.email,
                      txtText: "E-Mail",
                      validate: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Text je prázdny!';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text)) {
                          return 'E-Mail ma zlý formát!';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      maxLines: true,
                      txtController: _phoneTextController,
                      txtIcon: Icons.phone,
                      txtText: "Telefónne Číslo",
                      validate: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Text je prázdny!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ]),
                ),
              ],
            ),
          ),
          Material(
            color: Colors.white,
            child: SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetX<BagController>(
                    builder: (_) => Expanded(
                      child: CustomText(
                        padding: const EdgeInsets.only(left: 40),
                        text: "Suma: ${bagController.totalAmount} €",
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 25, 40, 25),
                    child: GetX<OrderController>(
                      builder: (_) => orderController.isLoading.value
                          ? const CircularProgressIndicator()
                          : CustomButton(
                              text: "Objednať",
                              txtSize: 15,
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.INFO,
                                    animType: AnimType.BOTTOMSLIDE,
                                    title: 'Objednať?',
                                    desc: 'Objednať s povinnosťou platby',
                                    btnOkText: "Objednať",
                                    btnCancelOnPress: () {},
                                    btnOkOnPress: () {
                                      orderController.loading(true);
                                      OrderModel _order = OrderModel(
                                          createdAt: Timestamp.now(),
                                          bagProducts:
                                              bagController.getProducts(),
                                          firstName: _firstNameTextController
                                              .text
                                              .trim(),
                                          surname: _surnameTextController.text
                                              .trim(),
                                          city: _cityTextController.text.trim(),
                                          street:
                                              _streetTextController.text.trim(),
                                          psc: _pscTextController.text.trim(),
                                          phone:
                                              _phoneTextController.text.trim(),
                                          email:
                                              _emailTextController.text.trim(),
                                          country:
                                              orderController.country.value,
                                          total:
                                              bagController.totalAmount.value,
                                          resolved: false);
                                      orderController.createOrder(_order);
                                      bagController.emptyBag();
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil('/shop',
                                              (Route<dynamic> route) => false);
                                      orderController.loading(false);
                                    },
                                  ).show();
                                }
                              },
                              bgColor: Colors.red,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
