import 'package:flutter/material.dart';
import 'package:webstore/models/product_model.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class AdminProductCard extends StatefulWidget {
  final ProductModel product;
  final int? amountOrdered;
  const AdminProductCard({
    Key? key,
    required this.product,
    this.amountOrdered,
  }) : super(key: key);

  @override
  _AdminProductCardState createState() => _AdminProductCardState();
}

class _AdminProductCardState extends State<AdminProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        onTap: () {
          Navigator.of(context)
              .pushNamed("/admin/products/${widget.product.id}");
        },
        child: Column(
          children: [
            Container(
              width: 300,
              height: 325,
              decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                      image: NetworkImage(widget.product.imgsUrl![0]),
                      fit: BoxFit.cover)),
            ),
            Container(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Column(children: [
                  CustomText(
                    size: 20,
                    text: widget.product.title,
                  ),
                  CustomText(text: "Amount: ${widget.amountOrdered}"),
                  CustomText(
                    size: 16,
                    weight: FontWeight.bold,
                    text: "${widget.product.price} €",
                  ),
                ])),
          ],
        ),
      ),
    );
  }
}
