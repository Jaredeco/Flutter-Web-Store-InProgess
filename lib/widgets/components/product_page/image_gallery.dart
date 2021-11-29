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
  final ScrollController sc = ScrollController();
  double anm = 0;
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
              border: const Border(right: BorderSide(color: Colors.white)),
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
            width: 725,
            child: Stack(
              children: [
                SingleChildScrollView(
                  controller: sc,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _gallery,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            double w = 175.0 * widget.imgsUrl!.length;
                            if (anm >= w * 0.2) {
                              anm -= w * 0.2;
                            }
                            sc.animateTo(anm,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                          icon: Icon(Icons.arrow_back_ios_new_rounded)),
                      IconButton(
                          onPressed: () {
                            double w = 175.0 * widget.imgsUrl!.length;
                            if (anm <= w - (w * 0.2)) {
                              anm += w * 0.2;
                            }
                            sc.animateTo(anm,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                          icon: Icon(Icons.arrow_forward_ios_rounded)),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
