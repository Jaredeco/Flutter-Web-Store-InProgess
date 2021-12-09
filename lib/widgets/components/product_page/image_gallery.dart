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
  @override
  Widget build(BuildContext context) {
    double anm = 0;
    double width = 770;
    double point = 0;
    double w = width / 3 * widget.imgsUrl!.length - 40;
    List<Widget> _gallery = List<Widget>.generate(
      widget.imgsUrl!.length,
      (index) => GestureDetector(
        onTap: () {
          productController.changeImg(index);
        },
        child: Container(
          height: 150,
          width: width / 3,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GetX<ProductController>(
            builder: (_) => Container(
                height: 400,
                width: width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget
                          .imgsUrl![productController.selectedImage.value]
                          .toString()),
                      fit: BoxFit.cover),
                ))),
        SizedBox(
          width: width,
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
                          if (point - 0.2 >= 0) {
                            point -= 0.2;
                            anm = w * point;
                            sc.animateTo(anm,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          }
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                    IconButton(
                        onPressed: () {
                          if (point + 0.2 <= 1) {
                            point += 0.2;
                            anm = w * point;
                            sc.animateTo(anm,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          }
                        },
                        icon: const Icon(Icons.arrow_forward_ios_rounded)),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
