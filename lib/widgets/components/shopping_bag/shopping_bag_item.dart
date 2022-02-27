import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/controllers/bag_controller.dart';
import 'package:webstore/models/product_model.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class BagItem extends StatefulWidget {
  final ProductModel product;
  final AnimationController? animationController;
  final Animation<double>? animation;
  final String option;
  const BagItem(
      {Key? key,
      required this.product,
      required this.option,
      this.animationController,
      this.animation})
      : super(key: key);

  @override
  _BagItemState createState() => _BagItemState();
}

class _BagItemState extends State<BagItem> {
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
                  child: InkWell(
                    onTap: () => Navigator.of(context)
                        .pushNamed("/product/${widget.product.id}"),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                              height: 150,
                              width: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(widget.product.imgsUrl![0],
                                    fit: BoxFit.cover),
                              ),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                          ),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                size: 25,
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                text: widget.product.title,
                                color: const Color(0xFF45E994),
                              ),
                              const SizedBox(height: 5),
                              CustomText(
                                size: 12,
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                text: widget.option,
                                color: const Color(0xFF7C8FB5),
                              ),
                            ],
                          )),
                          Expanded(
                            child: CustomText(
                              size: 20,
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              text: "${widget.product.price} €",
                              color: const Color(0xFF45E994),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                    onPressed: () =>
                                        bagController.removeFromBag(
                                            widget.product, widget.option),
                                    icon: const Icon(Icons.remove,
                                        color: Color(0xFF7C8FB5))),
                                GetX<BagController>(
                                    builder: (_) => CustomText(
                                          text: bagController.products[
                                                  bagController.getBagItem(
                                                      widget.product,
                                                      widget.option)]
                                              .toString(),
                                          color: const Color(0xFF45E994),
                                        )),
                                IconButton(
                                    onPressed: () => bagController.addToBag(
                                        widget.product, widget.option, 1),
                                    icon: const Icon(
                                      Icons.add,
                                      color: Color(0xFF7C8FB5),
                                    )),
                              ],
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                                onPressed: () => bagController.deleteFromBag(
                                    widget.product, widget.option),
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          )
                        ]),
                  )));
        });
  }
}
