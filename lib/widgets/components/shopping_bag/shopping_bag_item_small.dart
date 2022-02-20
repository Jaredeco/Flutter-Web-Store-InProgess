import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/controllers/bag_controller.dart';
import 'package:webstore/models/product_model.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class BagItemSmall extends StatefulWidget {
  final ProductModel product;
  final AnimationController? animationController;
  final Animation<double>? animation;
  final String option;
  const BagItemSmall(
      {Key? key,
      required this.product,
      required this.option,
      this.animationController,
      this.animation})
      : super(key: key);

  @override
  _BagItemSmallState createState() => _BagItemSmallState();
}

class _BagItemSmallState extends State<BagItemSmall> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.of(context).pushNamed("/product/${widget.product.id}"),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Expanded(
          child: Container(
            height: 150,
            width: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child:
                  Image.network(widget.product.imgsUrl![0], fit: BoxFit.cover),
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ),
        Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
                size: 16,
                padding: const EdgeInsets.only(left: 20, right: 20),
                text: widget.product.title),
            const SizedBox(height: 5),
            CustomText(
              size: 12,
              padding: const EdgeInsets.only(left: 20, right: 20),
              text: widget.option,
              color: Colors.grey,
            ),
            const SizedBox(height: 5),
            CustomText(
              size: 16,
              padding: const EdgeInsets.only(left: 20, right: 20),
              text: "${widget.product.price} €",
            ),
          ],
        )),
        Expanded(
          child: Column(
            children: [
              IconButton(
                  onPressed: () => bagController.deleteFromBag(
                      widget.product, widget.option),
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () => bagController.removeFromBag(
                          widget.product, widget.option),
                      icon: const Icon(Icons.remove)),
                  GetX<BagController>(
                      builder: (_) => Text(bagController.products[bagController
                              .getBagItem(widget.product, widget.option)]
                          .toString())),
                  IconButton(
                      onPressed: () => bagController.addToBag(
                          widget.product, widget.option, 1),
                      icon: const Icon(Icons.add)),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
