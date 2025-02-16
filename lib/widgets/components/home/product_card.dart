import 'package:flutter/material.dart';
import 'package:webstore/models/product_model.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;
  final String? option;
  final int? amount;
  final AnimationController? animationController;
  final Animation<double>? animation;
  const ProductCard(
      {Key? key,
      required this.product,
      this.option,
      this.amount,
      this.animationController,
      this.animation})
      : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.animationController!,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
              opacity: widget.animation!,
              child: Transform(
                  transform: Matrix4.translationValues(
                      0.0, 30 * (1.0 - widget.animation!.value), 0.0),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed("/product/${widget.product.id}");
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
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  offset: const Offset(0, 8),
                                  blurRadius: 8,
                                ),
                              ],
                              color: Colors.grey[50],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          Container(
                              width: 300,
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 20),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      size: 25,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      text: widget.product.title,
                                      color: const Color(0xFF45E994),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        widget.product.descriptionTop!,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF7C8FB5),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        softWrap: false,
                                      ),
                                    ),
                                    CustomText(
                                      size: 16,
                                      text: "${widget.product.price} €",
                                      color: const Color(0xFF45E994),
                                    ),
                                    if (widget.option != null)
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          widget.option!,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Color(0xFF7C8FB5),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          softWrap: false,
                                        ),
                                      ),
                                    if (widget.amount != null)
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 10),
                                        child: Text(
                                          "Počet: ${widget.amount!.toString()}",
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Color(0xFF7C8FB5),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          softWrap: false,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                  ])),
                        ],
                      ),
                    ),
                  )));
        });
  }
}
