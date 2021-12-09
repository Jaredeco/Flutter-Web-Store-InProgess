import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/constants/firebase.dart';
import 'package:webstore/controllers/admin_controller.dart';
import 'package:webstore/models/product_model.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/components/product_page/image_gallery.dart';
import 'package:webstore/widgets/customWidgets/custom_button.dart';
import 'package:webstore/widgets/customWidgets/custom_textfield.dart';

class AdminProductPage extends StatefulWidget {
  final String productId;
  const AdminProductPage({Key? key, required this.productId}) : super(key: key);

  @override
  _AdminProductPageState createState() => _AdminProductPageState();
}

class _AdminProductPageState extends State<AdminProductPage> {
  @override
  void initState() {
    super.initState();
    if (!adminController.loggedIn.value) {
      SystemNavigator.pop();
    }
  }

  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _priceTextController = TextEditingController();
  final TextEditingController _descriptionTextController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: productController.getProduct(widget.productId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            ProductModel product = ProductModel.fromDocSnapshot(snapshot.data!);
            _titleTextController.text = product.title!;
            _descriptionTextController.text = product.description!;
            _priceTextController.text = product.price!.toString();
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: ResponsiveUi(
                      admin: true,
                      largeWidgets: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ImageGallery(imgsUrl: product.imgsUrl),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomTextField(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    maxLines: true,
                                    txtController: _titleTextController,
                                    txtIcon: Icons.title,
                                    txtText: "Product Title",
                                    validate: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'Text is empty!';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Center(
                                      child: CustomTextField(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    txtController: _descriptionTextController,
                                    txtIcon: Icons.description,
                                    kbdType: TextInputType.multiline,
                                    maxLines: false,
                                    txtText: "Product Description",
                                    validate: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'Text is empty!';
                                      }
                                      return null;
                                    },
                                  )),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  CustomTextField(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    maxLines: true,
                                    txtController: _priceTextController,
                                    txtIcon: Icons.money,
                                    txtText: "Product Price",
                                    validate: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'Text is empty!';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                      smallWidgets: [
                        ImageGallery(imgsUrl: product.imgsUrl),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          width: MediaQuery.of(context).size.width * 0.8,
                          maxLines: true,
                          txtController: _titleTextController,
                          txtIcon: Icons.title,
                          txtText: "Product Title",
                          validate: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Text is empty!';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: CustomTextField(
                          width: MediaQuery.of(context).size.width * 0.8,
                          txtController: _descriptionTextController,
                          txtIcon: Icons.description,
                          kbdType: TextInputType.multiline,
                          maxLines: false,
                          txtText: "Product Description",
                          validate: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Text is empty!';
                            }
                            return null;
                          },
                        )),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          width: MediaQuery.of(context).size.width * 0.8,
                          maxLines: true,
                          txtController: _priceTextController,
                          txtIcon: Icons.money,
                          txtText: "Product Price",
                          validate: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Text is empty!';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  Material(
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 25, 40, 25),
                            child: GetX<AdminController>(
                              builder: (_) => adminController.isCreating.value
                                  ? const CircularProgressIndicator()
                                  : CustomButton(
                                      text: "Update",
                                      onTap: () async {
                                        if (_formKey.currentState!.validate()) {
                                          AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.INFO,
                                            animType: AnimType.BOTTOMSLIDE,
                                            title: 'Update?',
                                            desc:
                                                'Update modified product fields?',
                                            btnOkText: "Order",
                                            btnCancelOnPress: () {},
                                            btnOkOnPress: () async {
                                              adminController.loading(true);
                                              Map<String, dynamic> _update = {
                                                "title": _titleTextController
                                                    .text
                                                    .trim(),
                                                "description":
                                                    _descriptionTextController
                                                        .text
                                                        .trim(),
                                                "price": double.parse(
                                                    _priceTextController.text
                                                        .trim())
                                              };
                                              await firebaseFirestore
                                                  .collection("Products")
                                                  .doc(widget.productId)
                                                  .update(_update);
                                              Navigator.of(context)
                                                  .pushNamed("/shop");
                                              adminController.loading(false);
                                            },
                                          ).show();
                                        }
                                      }),
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
          return Container();
        });
  }
}
