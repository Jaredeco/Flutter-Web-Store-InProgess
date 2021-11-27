import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/constants/firebase.dart';
import 'package:webstore/controllers/admin_controller.dart';
import 'package:webstore/models/product_model.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/screens/main/home_page.dart';
import 'package:webstore/widgets/customWidgets/custom_button.dart';
import 'package:webstore/widgets/customWidgets/custom_textfield.dart';
import 'package:image_picker/image_picker.dart';

class AdminCreateProduct extends StatefulWidget {
  const AdminCreateProduct({Key? key}) : super(key: key);

  @override
  _AdminCreateProductState createState() => _AdminCreateProductState();
}

class _AdminCreateProductState extends State<AdminCreateProduct> {
  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _priceTextController = TextEditingController();
  final TextEditingController _descriptionTextController =
      TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: ResponsiveUi(
              admin: true,
              largeWidgets: [
                Center(
                  child: Column(children: [
                    CustomTextField(
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
                    CustomTextField(
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
                    Center(
                        child: CustomTextField(
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
                    const SizedBox(height: 20),
                    GetX<AdminController>(
                      builder: (_) => Row(children: [
                        for (var i in adminController.pickedImages)
                          SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.network(i.path))
                      ]),
                    ),
                    const SizedBox(height: 40),
                  ]),
                ),
              ],
            ),
          ),
          Material(
            child: SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 25, 40, 25),
                    child: CustomButton(
                        text: "Pick Image",
                        onTap: () async {
                          final List<XFile>? _images =
                              await _picker.pickMultiImage();
                          adminController.addImages(_images!);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 25, 40, 25),
                    child: GetX<AdminController>(
                      builder: (_) => adminController.isCreating.value
                          ? const CircularProgressIndicator()
                          : CustomButton(
                              text: "Create",
                              onTap: () async {
                                if (adminController.pickedImages.isNotEmpty) {
                                  if (_formKey.currentState!.validate()) {
                                    adminController.loading(true);
                                    List<String> _imgUrls =
                                        await adminController.uploadImages(
                                            adminController.pickedImages);
                                    ProductModel _product = ProductModel(
                                        createAt: Timestamp.now(),
                                        imgsUrl: _imgUrls,
                                        title: _titleTextController.text.trim(),
                                        description: _descriptionTextController
                                            .text
                                            .trim(),
                                        price: double.parse(
                                            _priceTextController.text.trim()));
                                    await firebaseFirestore
                                        .collection("Products")
                                        .add(_product.toJson());
                                    adminController.loading(false);
                                    Navigator.of(context).pushNamed("/");
                                  }
                                } else {
                                  Get.snackbar("No image uploaded!",
                                      "Please provide images for creating product!",
                                      backgroundColor: Colors.white,
                                      margin: const EdgeInsets.all(20),
                                      duration: const Duration(seconds: 2),
                                      snackPosition: SnackPosition.BOTTOM);
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
}
