import 'package:flutter/material.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class ProductCard extends StatefulWidget {
  final String? title;
  final int? price;
  const ProductCard({Key? key, required this.title, required this.price})
      : super(key: key);

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
        onTap: () {},
        child: Stack(
          children: [
            Column(
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
                Container(
                    padding: const EdgeInsets.only(top:10, bottom: 20),
                    child: Column(children: [
                      CustomText(
                        weight: FontWeight.bold,
                        size: 15,
                        text: widget.title,
                      ),
                      const SizedBox(height: 5),
                      CustomText(
                        size: 13,
                        color: Colors.grey,
                        text: "${widget.price} \$",
                      ),
                    ]))
              ],
            )
          ],
        ),
      ),
    );
  }
}
