import 'package:flutter/material.dart';
import 'package:webstore/models/product_model.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;
  final int? amountOrdered;
  final bool admin;
  const ProductCard(
      {Key? key, required this.product, this.amountOrdered, this.admin = false})
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
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        onTap: () {
          if (widget.admin) {
            Navigator.of(context)
                .pushNamed("/admin/products/${widget.product.id}");
          } else {
            Navigator.of(context).pushNamed("/product/${widget.product.id}");
          }
        },
        child: Column(
          children: [
            Container(
              width: 300,
              height: 325,
              decoration: BoxDecoration(
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
                  widget.amountOrdered != null
                      ? CustomText(text: "Amount: ${widget.amountOrdered}")
                      : Container(
                          padding: const EdgeInsets.all(20),
                          width: 300,
                          child: Text(
                            widget.product.description!,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                          ),
                        ),
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
