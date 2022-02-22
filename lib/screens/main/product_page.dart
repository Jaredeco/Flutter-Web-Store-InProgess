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
import 'package:webstore/widgets/components/home/sort_drop_down.dart';
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
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      productController.changeImg(0);
      productController.amount.value = 1;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: productController.getProduct(widget.productId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }
          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("Product does not exist");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            ProductModel product = ProductModel.fromDocSnapshot(snapshot.data!);
            SchedulerBinding.instance!.addPostFrameCallback((_) {
              productController.setProductOption(product.options![0]);
            });
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
                                    size: 40,
                                    weight: FontWeight.bold,
                                    color: const Color(0xFF45E994),
                                  ),
                                  CustomText(
                                    textAlign: TextAlign.left,
                                    text: product.description,
                                    color: const Color(0xFF7C8FB5),
                                    size: 15,
                                    padding: const EdgeInsets.only(top: 30),
                                  ),
                                  if (product.options!.isNotEmpty)
                                    GetX<ProductController>(
                                      builder: (controller) => SortDropDown(
                                        width: 250,
                                        cValue: product.options!.contains(
                                                productController
                                                    .productOption.value)
                                            ? productController
                                                .productOption.value
                                            : product.options![0],
                                        ddItems: product.options,
                                        onChanged: (newValue) {
                                          productController
                                              .setProductOption(newValue!);
                                        },
                                      ),
                                    ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  CustomText(
                                    textAlign: TextAlign.left,
                                    text: "${product.price} €",
                                    weight: FontWeight.bold,
                                    size: 20,
                                    color: const Color(0xFF45E994),
                                  ),
                                  const CustomText(
                                    textAlign: TextAlign.left,
                                    text: "vrátane DPH",
                                    color: Color(0xFF7C8FB5),
                                    size: 10,
                                    padding: EdgeInsets.only(bottom: 20),
                                  ),
                                  featureColumn(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.of(context)
                                        .pushNamed("/shop"),
                                    child: SizedBox(
                                        height: 90,
                                        width: 150,
                                        child: Image.asset(
                                            "assets/images/logo_vego.png")),
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
                              textAlign: TextAlign.center,
                              text: product.title,
                              size: 30,
                              weight: FontWeight.bold,
                              color: const Color(0xFF45E994),
                            ),
                            if (product.options!.isNotEmpty)
                              Center(
                                child: GetX<ProductController>(
                                  builder: (controller) => SortDropDown(
                                    width: 250,
                                    cValue: product.options!.contains(
                                            productController
                                                .productOption.value)
                                        ? productController.productOption.value
                                        : product.options![0],
                                    ddItems: product.options,
                                    onChanged: (newValue) {
                                      productController
                                          .setProductOption(newValue!);
                                    },
                                  ),
                                ),
                              ),
                            CustomText(
                              textAlign: TextAlign.left,
                              text: product.description,
                              color: const Color(0xFF7C8FB5),
                              size: 15,
                              padding: const EdgeInsets.only(top: 30),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomText(
                              textAlign: TextAlign.left,
                              text: "${product.price} €",
                              weight: FontWeight.bold,
                              color: const Color(0xFF45E994),
                              size: 25,
                            ),
                            const CustomText(
                              textAlign: TextAlign.left,
                              text: "vrátane DPH",
                              color: Color(0xFF7C8FB5),
                              size: 12,
                              padding: EdgeInsets.only(bottom: 20),
                            ),
                            featureColumn(),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: InkWell(
                                onTap: () =>
                                    Navigator.of(context).pushNamed("/shop"),
                                child: SizedBox(
                                    height: 90,
                                    width: 150,
                                    child: Image.asset(
                                        "assets/images/logo_vego.png")),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
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
                                text: "Kúpiť",
                                onTap: () {
                                  if (!bagController.products.containsKey(
                                      bagController.getBagItem(
                                          product,
                                          productController
                                              .productOption.value))) {
                                    bagController.addToBag(
                                        product,
                                        productController.productOption.value,
                                        productController.amount.value);
                                    showTopSnackBar(
                                      context,
                                      const CustomSnackBar.success(
                                        message:
                                            "Produkt bol pridaný do košíka.",
                                      ),
                                    );
                                  } else {
                                    showTopSnackBar(
                                      context,
                                      const CustomSnackBar.error(
                                        message:
                                            "Produkt už bol pridaný do košíka!",
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

  Widget featureRow(IconData icon, String txt) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xFF7C8FB5),
          size: 15,
        ),
        const SizedBox(
          width: 5,
        ),
        CustomText(
          size: 15,
          text: txt,
          color: const Color(0xFF7C8FB5),
        )
      ],
    );
  }

  Widget featureColumn() {
    return Column(
      children: [
        featureRow(Icons.money, "DOBIERKA"),
        featureRow(Icons.local_shipping, "BEZPLATNÁ DOPRAVA")
      ],
    );
  }
}
