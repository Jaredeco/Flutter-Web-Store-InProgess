import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/constants/firebase.dart';
import 'package:webstore/controllers/admin_controller.dart';
import 'package:webstore/models/product_model.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/customWidgets/custom_button.dart';
import 'package:webstore/widgets/customWidgets/custom_textfield.dart';
import 'package:image_picker/image_picker.dart';

class AdminCreateProduct extends StatefulWidget {
  const AdminCreateProduct({Key? key}) : super(key: key);

  @override
  _AdminCreateProductState createState() => _AdminCreateProductState();
}

class _AdminCreateProductState extends State<AdminCreateProduct> {
  @override
  void initState() {
    if (!adminController.loggedIn.value) {
      SystemNavigator.pop();
    }
    super.initState();
  }

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
                    CustomTextField(
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
                      builder: (_) =>
                          Wrap(alignment: WrapAlignment.center, children: [
                        for (int i = 0;
                            i < adminController.pickedImages.length;
                            i++)
                          Stack(
                            children: [
                              InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width: 250,
                                    height: 210,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                          adminController.pickedImages[i].path,
                                          fit: BoxFit.cover),
                                    ),
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                    onPressed: () {
                                      adminController.pickedImages.removeAt(i);
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    )),
                              )
                            ],
                          ),
                      ]),
                    ),
                    const SizedBox(height: 40),
                  ]),
                ),
                if (MediaQuery.of(context).size.width <= largePageSize)
                  Column(
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
                                    if (adminController
                                        .pickedImages.isNotEmpty) {
                                      if (_formKey.currentState!.validate()) {
                                        adminController.loading(true);
                                        List<String> _imgUrls =
                                            await adminController.uploadImages(
                                                adminController.pickedImages);
                                        ProductModel _product = ProductModel(
                                            createAt: Timestamp.now(),
                                            imgsUrl: _imgUrls,
                                            title: _titleTextController.text
                                                .trim(),
                                            description:
                                                _descriptionTextController.text
                                                    .trim(),
                                            price: double.parse(
                                                _priceTextController.text
                                                    .trim()));
                                        await firebaseFirestore
                                            .collection("Products")
                                            .add(_product.toJson());
                                        Navigator.of(context)
                                            .pushNamed("/shop");
                                        adminController.loading(false);
                                      }
                                    } else {
                                      showTopSnackBar(
                                        context,
                                        const CustomSnackBar.error(
                                          message: "No images attached!",
                                        ),
                                      );
                                    }
                                  }),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
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
                                          title:
                                              _titleTextController.text.trim(),
                                          description:
                                              _descriptionTextController.text
                                                  .trim(),
                                          price: double.parse(
                                              _priceTextController.text
                                                  .trim()));
                                      await firebaseFirestore
                                          .collection("Products")
                                          .add(_product.toJson());
                                      Navigator.of(context).pushNamed("/shop");
                                      adminController.loading(false);
                                    }
                                  } else {
                                    showTopSnackBar(
                                      context,
                                      const CustomSnackBar.error(
                                        message: "No images attached!",
                                      ),
                                    );
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
