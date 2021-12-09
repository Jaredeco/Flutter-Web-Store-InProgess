import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/controllers/bag_controller.dart';
import 'package:webstore/models/product_model.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class BagItemSmall extends StatefulWidget {
  final ProductModel product;
  const BagItemSmall({Key? key, required this.product}) : super(key: key);

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
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.product.imgsUrl![0]),
                  fit: BoxFit.cover),
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
        Expanded(
            child: Column(
          children: [
            CustomText(
              size: 20,
              padding: const EdgeInsets.only(left: 20, right: 20),
              text: widget.product.title,
            ),
            CustomText(
              size: 20,
              padding: const EdgeInsets.only(left: 20, right: 20),
              text: "${widget.product.price} €",
            ),
          ],
        )),
        Expanded(
          child: Column(
            children: [
              IconButton(
                  onPressed: () => bagController.deleteFromBag(widget.product),
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () =>
                          bagController.removeFromBag(widget.product),
                      icon: const Icon(Icons.remove)),
                  GetX<BagController>(
                      builder: (_) => Text(
                          bagController.products[widget.product].toString())),
                  IconButton(
                      onPressed: () =>
                          bagController.addToBag(widget.product, 1),
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
