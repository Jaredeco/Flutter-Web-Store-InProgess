import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/controllers/bag_controller.dart';
import 'package:webstore/models/product_model.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class BagItem extends StatefulWidget {
  final ProductModel product;
  const BagItem({Key? key, required this.product}) : super(key: key);

  @override
  _BagItemState createState() => _BagItemState();
}

class _BagItemState extends State<BagItem> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
          child: CustomText(
        size: 20,
        padding: const EdgeInsets.only(left: 20, right: 20),
        text: widget.product.title,
      )),
      Expanded(
        child: CustomText(
          size: 20,
          padding: const EdgeInsets.only(left: 20, right: 20),
          text: "${widget.product.price} €",
        ),
      ),
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () => bagController.removeFromBag(widget.product),
                icon: const Icon(Icons.remove)),
            GetX<BagController>(
                builder: (_) =>
                    Text(bagController.products[widget.product].toString())),
            IconButton(
                onPressed: () => bagController.addToBag(widget.product, 1),
                icon: const Icon(Icons.add)),
          ],
        ),
      ),
      Expanded(
        child: IconButton(
            onPressed: () => bagController.deleteFromBag(widget.product),
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            )),
      )
    ]);
  }
}
