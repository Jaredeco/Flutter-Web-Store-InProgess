import 'package:flutter/material.dart';
import 'package:webstore/models/product_model.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class AdminProductCard extends StatefulWidget {
  final ProductModel product;
  final int? amountOrdered;
  final String? option;
  const AdminProductCard({
    Key? key,
    required this.product,
    this.amountOrdered,
    this.option,
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(widget.product.imgsUrl![0],
                    fit: BoxFit.cover),
              ),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Column(children: [
                  CustomText(
                    size: 20,
                    text: widget.product.title,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: 300,
                    child: Text(
                      widget.product.descriptionTop!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                    ),
                  ),
                  if (widget.option != null) CustomText(text: widget.option),
                  if (widget.amountOrdered != null)
                    CustomText(text: "Amount: ${widget.amountOrdered}"),
                  const SizedBox(
                    height: 10,
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
