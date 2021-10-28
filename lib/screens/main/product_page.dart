import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/customWidgets/custom_button.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveUi(largeWidgets: [
      ImageSlideshow(
        height: Get.height * 0.45,
        children: [
          Image.asset("assets/images/product.jpg"),
          Image.asset("assets/images/product.jpg"),
          Image.asset("assets/images/product.jpg"),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Expanded(
            child: CustomText(
              padding: EdgeInsets.all(20),
              text: "Product Title",
              weight: FontWeight.bold,
              size: 40,
            ),
          ),
          // SizedBox(width: 50,),
          Expanded(
            child: CustomText(
              color: Colors.grey,
              padding: EdgeInsets.all(20),
              text: "20 Eur",
              size: 20,
            ),
          ),
        ],
      ),
      const CustomText(
        text: "This is a description for this product",
        color: Colors.grey,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(500, 20, 500, 20),
        child: CustomButton(text: "Add to Cart", onTap: () {}, bgColor: Colors.black),
      ),

    ]);
  }
}
