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
  final TextEditingController _title = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return ResponsiveUi(
      largeWidgets: [
        Center(
            child: CustomTextField(
                txtController: _title,
                txtIcon: Icons.title,
                txtText: "Product Title")),
        Center(
            child: CustomTextField(
                txtController: _price,
                txtIcon: Icons.money,
                txtText: "Product Price")),
        Center(
            child: CustomTextField(
                txtController: _description,
                txtIcon: Icons.description,
                txtText: "Product Description")),
        const SizedBox(height: 20),
        Center(
            child: CustomButton(
                text: "Pick Image",
                onTap: () async {
                  final List<XFile>? _images = await _picker.pickMultiImage();
                  adminController.addImages(_images!);
                })),
        GetX<AdminController>(
          builder: (_) => Row(children: [
            for (var i in adminController.pickedImages)
              SizedBox(height: 50, width: 50, child: Image.network(i.path))
          ]),
        ),
        const SizedBox(height: 40),
        Center(
            child: CustomButton(
                text: "Create",
                onTap: () async {
                  List<String> _imgUrls = await adminController
                      .uploadImages(adminController.pickedImages);
                  ProductModel _product = ProductModel(
                      imgsUrl: _imgUrls,
                      title: _title.text,
                      description: _description.text,
                      price: double.parse(_price.text));
                  await firebaseFirestore
                      .collection("Products")
                      .add(_product.toJson());
                  Get.to(() => const HomePage());
                })),
      ],
    );
  }
}
