import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/controllers/bag_controller.dart';
import 'package:webstore/controllers/product_controller.dart';
import 'package:webstore/models/product_model.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/components/product_page/image_gallery.dart';
import 'package:webstore/widgets/customWidgets/custom_button.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class ProductPage extends StatefulWidget {
  final String productId;
  const ProductPage({Key? key, required this.productId}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      productController.changeImg(0);
      productController.amount.value = 1;
    });
  }

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
            return Column(
              children: [
                Expanded(
                  child: ResponsiveUi(
                    largeWidgets: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              child: ImageGallery(imgsUrl: product.imgsUrl)),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomText(
                                    textAlign: TextAlign.left,
                                    text: product.title,
                                    size: 30,
                                  ),
                                  CustomText(
                                    textAlign: TextAlign.left,
                                    text: product.description,
                                    color: Colors.grey,
                                    size: 15,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30),
                                  ),
                                  CustomText(
                                    textAlign: TextAlign.left,
                                    text: "${product.price} €",
                                    weight: FontWeight.bold,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                    smallWidgets: [
                      ImageGallery(imgsUrl: product.imgsUrl),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              textAlign: TextAlign.left,
                              text: product.title,
                              size: 30,
                            ),
                            CustomText(
                              textAlign: TextAlign.left,
                              text: product.description,
                              color: Colors.grey,
                              size: 15,
                              padding: const EdgeInsets.symmetric(vertical: 30),
                            ),
                            CustomText(
                              textAlign: TextAlign.left,
                              text: "${product.price} €",
                              weight: FontWeight.bold,
                              size: 20,
                              padding: const EdgeInsets.only(bottom: 20),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      onPressed: () =>
                                          productController.decAmount(),
                                      icon: const Icon(Icons.remove)),
                                  const SizedBox(width: 50),
                                  GetX<ProductController>(
                                      builder: (_) => Text(productController
                                          .amount.value
                                          .toString())),
                                  const SizedBox(width: 50),
                                  IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () =>
                                          productController.incAmount()),
                                ]),
                          ],
                        ),
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
                        GetX<BagController>(
                          builder: (_) => CustomText(
                            padding: const EdgeInsets.only(left: 40),
                            text: "Total: ${bagController.totalAmount} €",
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (MediaQuery.of(context).size.width >=
                                largePageSize)
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                        onPressed: () =>
                                            productController.decAmount(),
                                        icon: const Icon(Icons.remove)),
                                    const SizedBox(width: 50),
                                    GetX<ProductController>(
                                        builder: (_) => Text(productController
                                            .amount.value
                                            .toString())),
                                    const SizedBox(width: 50),
                                    IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () =>
                                            productController.incAmount()),
                                  ]),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 25, 40, 25),
                              child: CustomButton(
                                text: "Add to bag",
                                onTap: () {
                                  if (!bagController.products.keys
                                      .map((e) => e.id)
                                      .contains(product.id)) {
                                    bagController.addToBag(product,
                                        productController.amount.value);
                                    showTopSnackBar(
                                      context,
                                      const CustomSnackBar.success(
                                        message:
                                            "Product added to the shopping bag!",
                                      ),
                                    );
                                  } else {
                                    showTopSnackBar(
                                      context,
                                      const CustomSnackBar.error(
                                        message:
                                            "Product already added to your shopping bag!",
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
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
