import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:webstore/admin/products/product_card_admin.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/constants/firebase.dart';
import 'package:webstore/controllers/order_controller.dart';
import 'package:webstore/models/order_model.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/components/home/product_card.dart';
import 'package:webstore/widgets/customWidgets/custom_button.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class AdminOrderPage extends StatefulWidget {
  final String orderId;
  const AdminOrderPage({Key? key, required this.orderId}) : super(key: key);

  @override
  State<AdminOrderPage> createState() => _AdminOrderPageState();
}

class _AdminOrderPageState extends State<AdminOrderPage> {
  @override
  void initState() {
    if (!adminController.loggedIn.value) {
      SystemNavigator.pop();
    }
    super.initState();
  }

  Widget infoItem(String leading, String title) {
    return ListTile(
      leading: CustomText(
        text: leading,
        weight: FontWeight.bold,
        padding: const EdgeInsets.only(right: 25),
      ),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: orderController.getOrder(widget.orderId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            OrderModel order = OrderModel.fromDocSnapshot(snapshot.data!);
            orderController.orderedProducts.bindStream(orderController
                .loadOrderedProducts(order.bagProducts!.keys.toList()));
            return Column(
              children: [
                Expanded(
                  child: ResponsiveUi(admin: true, largeWidgets: [
                    const Center(
                      child: CustomText(
                        text: "Order Information",
                        size: 35,
                        padding: EdgeInsets.symmetric(vertical: 20),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        infoItem("First Name:", order.firstName!),
                        infoItem("Surname:", order.surname!),
                        infoItem("City:", order.city!),
                        infoItem("Street:", order.street!),
                        infoItem("PSC:", order.psc!),
                        infoItem("Country:", order.country!),
                        infoItem("E-Mail:", order.email!),
                        infoItem("Phone Number:", order.phone!),
                        infoItem("Total:", order.total!.toString()),
                        infoItem("Resolved:", order.resolved!.toString()),
                      ],
                    ),
                    const Center(
                      child: CustomText(
                        text: "Ordered Products",
                        size: 35,
                        padding: EdgeInsets.symmetric(vertical: 20),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GetX<OrderController>(
                            builder: (OrderController controller) {
                          if (controller != null &&
                              controller.orderedProducts != null) {
                            return Wrap(
                              alignment: WrapAlignment.center,
                              children: controller.orderedProducts
                                  .map((item) => AdminProductCard(
                                        amountOrdered:
                                            order.bagProducts![item.id],
                                        product: item,
                                      ))
                                  .toList()
                                  .cast<Widget>(),
                            );
                          } else {
                            return Container();
                          }
                        })),
                    if (MediaQuery.of(context).size.width <= largePageSize)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 25, 40, 25),
                            child: CustomButton(
                              bgColor: Colors.red,
                              txtColor: Colors.white,
                              text: "Delete",
                              onTap: () => AwesomeDialog(
                                context: context,
                                dialogType: DialogType.INFO,
                                animType: AnimType.BOTTOMSLIDE,
                                title: 'Delete?',
                                desc: 'Delete this order??',
                                btnOkText: "Delete",
                                btnCancelOnPress: () {},
                                btnOkOnPress: () async {
                                  await firebaseFirestore
                                      .collection("Orders")
                                      .doc(widget.orderId)
                                      .delete();
                                  Navigator.of(context)
                                      .pushNamed("/admin/orders");
                                },
                              ).show(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 25, 40, 25),
                            child: order.resolved == true
                                ? CustomButton(
                                    bgColor: Colors.red,
                                    txtColor: Colors.white,
                                    text: "Unresolve",
                                    onTap: () => AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.INFO,
                                          animType: AnimType.BOTTOMSLIDE,
                                          title: 'Unresolve?',
                                          desc:
                                              'Mark this order as not resolved?',
                                          btnOkText: "Unresolve",
                                          btnCancelOnPress: () {},
                                          btnOkOnPress: () async {
                                            await firebaseFirestore
                                                .collection("Orders")
                                                .doc(widget.orderId)
                                                .update({"resolved": false});
                                            Navigator.of(context)
                                                .pushNamed("/admin/orders");
                                          },
                                        ).show())
                                : CustomButton(
                                    bgColor: Colors.green,
                                    txtColor: Colors.white,
                                    text: "Resolve",
                                    onTap: () {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.INFO,
                                        animType: AnimType.BOTTOMSLIDE,
                                        title: 'Resolve?',
                                        desc: 'Mark this order as resolved?',
                                        btnOkText: "Resolve",
                                        btnCancelOnPress: () {},
                                        btnOkOnPress: () async {
                                          await firebaseFirestore
                                              .collection("Orders")
                                              .doc(widget.orderId)
                                              .update({"resolved": true});
                                          Navigator.of(context)
                                              .pushNamed("/admin/orders");
                                        },
                                      ).show();
                                    },
                                  ),
                          ),
                        ],
                      ),
                  ]),
                ),
                if (MediaQuery.of(context).size.width >= largePageSize)
                  Material(
                    color: Colors.white,
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 25, 40, 25),
                            child: CustomButton(
                              bgColor: Colors.red,
                              txtColor: Colors.white,
                              text: "Delete",
                              onTap: () => AwesomeDialog(
                                context: context,
                                dialogType: DialogType.INFO,
                                animType: AnimType.BOTTOMSLIDE,
                                title: 'Delete?',
                                desc: 'Delete this order??',
                                btnOkText: "Delete",
                                btnCancelOnPress: () {},
                                btnOkOnPress: () async {
                                  await firebaseFirestore
                                      .collection("Orders")
                                      .doc(widget.orderId)
                                      .delete();
                                  Navigator.of(context)
                                      .pushNamed("/admin/orders");
                                },
                              ).show(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 25, 40, 25),
                            child: order.resolved == true
                                ? CustomButton(
                                    bgColor: Colors.red,
                                    txtColor: Colors.white,
                                    text: "Unresolve",
                                    onTap: () => AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.INFO,
                                          animType: AnimType.BOTTOMSLIDE,
                                          title: 'Unresolve?',
                                          desc:
                                              'Mark this order as not resolved?',
                                          btnOkText: "Unresolve",
                                          btnCancelOnPress: () {},
                                          btnOkOnPress: () async {
                                            await firebaseFirestore
                                                .collection("Orders")
                                                .doc(widget.orderId)
                                                .update({"resolved": false});
                                            Navigator.of(context)
                                                .pushNamed("/admin/orders");
                                          },
                                        ).show())
                                : CustomButton(
                                    bgColor: Colors.green,
                                    txtColor: Colors.white,
                                    text: "Resolve",
                                    onTap: () => AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.INFO,
                                          animType: AnimType.BOTTOMSLIDE,
                                          title: 'Resolve?',
                                          desc: 'Mark this order as resolved?',
                                          btnOkText: "Resolve",
                                          btnCancelOnPress: () {},
                                          btnOkOnPress: () async {
                                            await firebaseFirestore
                                                .collection("Orders")
                                                .doc(widget.orderId)
                                                .update({"resolved": true});
                                            Navigator.of(context)
                                                .pushNamed("/admin/orders");
                                          },
                                        ).show()),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            );
          }
          return Container();
        });
  }
}
