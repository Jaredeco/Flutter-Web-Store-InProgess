import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/controllers/product_controller.dart';

class FullScreenImage extends StatefulWidget {
  final List<String>? imgsUrl;
  const FullScreenImage({Key? key, this.imgsUrl}) : super(key: key);

  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GetX<ProductController>(
              builder: (controller) => Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    image: DecorationImage(
                      image: NetworkImage(widget
                          .imgsUrl![controller.selectedImage.value]
                          .toString()),
                    ),
                  ))),
          Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: MaterialButton(
                splashColor: Colors.white,
                elevation: 0,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: const Color(0xFF45E994),
                textColor: Colors.white,
                child: const Icon(
                  Icons.close,
                  size: 24,
                ),
                padding: const EdgeInsets.all(16),
                shape: const CircleBorder(),
              )),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  splashColor: Colors.white,
                  elevation: 0,
                  onPressed: () {
                    if (productController.selectedImage.value > 0) {
                      productController
                          .changeImg(productController.selectedImage.value - 1);
                    }
                  },
                  color: const Color(0xFF45E994),
                  textColor: Colors.white,
                  child: const Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 24,
                  ),
                  padding: const EdgeInsets.all(16),
                  shape: const CircleBorder(),
                ),
                MaterialButton(
                  splashColor: Colors.white,
                  elevation: 0,
                  onPressed: () {
                    if (productController.selectedImage.value <
                        widget.imgsUrl!.length - 1) {
                      productController
                          .changeImg(productController.selectedImage.value + 1);
                    }
                  },
                  color: const Color(0xFF45E994),
                  textColor: Colors.white,
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 24,
                  ),
                  padding: const EdgeInsets.all(16),
                  shape: const CircleBorder(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
