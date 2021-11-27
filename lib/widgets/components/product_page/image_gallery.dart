import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/controllers/product_controller.dart';

class ImageGallery extends StatefulWidget {
  final List<String>? imgsUrl;
  const ImageGallery({Key? key, this.imgsUrl}) : super(key: key);
  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _gallery = List<Widget>.generate(
      widget.imgsUrl!.length,
      (index) => GestureDetector(
        onTap: () {
          productController.changeImg(index);
        },
        child: Container(
          height: 125,
          width: 175,
          decoration: BoxDecoration(
              border: const Border(right: BorderSide(color: Colors.black)),
              image: DecorationImage(
                  image: NetworkImage(
                    widget.imgsUrl![index].toString(),
                  ),
                  fit: BoxFit.cover)),
        ),
      ),
    );
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetX<ProductController>(
              builder: (_) => Container(
                  height: 400,
                  width: 725,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget
                            .imgsUrl![productController.selectedImage.value]
                            .toString()),
                        fit: BoxFit.cover),
                  ))),
          SizedBox(
            width: 700,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _gallery,
              ),
            ),
          )
        ],
      ),
    );
  }
}
