import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webstore/models/product_model.dart';
import 'package:webstore/screens/main/product_page.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        onTap: () {
          Get.to(() => ProductPage(product: widget.product));
        },
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 300,
                  height: 325,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                          image: AssetImage("assets/images/product.jpg"),
                          fit: BoxFit.cover)),
                ),
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                        onTap: () {
                          print("pressed");
                        },
                        child: const Icon(Icons.favorite_outline))),
              ],
            ),
            Container(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Column(children: [
                  CustomText(
                    size: 20,
                    text: widget.product.title,
                  ),
                  const CustomText(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    size: 13,
                    color: Colors.grey,
                    text: "This is a description of this product",
                  ),
                  CustomText(
                    size: 15,
                    weight: FontWeight.bold,
                    text: "${widget.product.price} \$",
                  ),
                ])),
          ],
        ),
      ),
    );
  }
}
