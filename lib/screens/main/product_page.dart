import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/models/product_model.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/components/product_page/image_gallery.dart';
import 'package:webstore/widgets/customWidgets/custom_button.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class ProductPage extends StatefulWidget {
  final ProductModel product;
  const ProductPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveUi(largeWidgets: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const ImageGallery(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    textAlign: TextAlign.left,
                    text: widget.product.title,
                    size: 30,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomText(
                    textAlign: TextAlign.left,
                    text: widget.product.title,
                    color: Colors.grey,
                    size: 15,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomText(
                    textAlign: TextAlign.left,
                    text: "${widget.product.price} \$",
                    weight: FontWeight.bold,
                    size: 20,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                    text: "Add to bag",
                    onTap: () {
                      if (!bagController.products.containsKey(widget.product)) {
                        bagController.addToBag(widget.product);
                      }
                      ;
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      )
    ]);
  }
}
