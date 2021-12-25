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

class _ImageGalleryState extends State<ImageGallery>
    with TickerProviderStateMixin {
  final ScrollController sc = ScrollController();

  AnimationController? animationController;
  @override
  void initState() {
    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double anm = 0;
    double width = 770;
    double point = 0;
    double w = width / 3 * widget.imgsUrl!.length - 40;

    final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(
            parent: animationController!,
            curve:
                const Interval((1 / 1) * 0, 1.0, curve: Curves.fastOutSlowIn)));

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GetX<ProductController>(
            builder: (_) {
              animationController!.forward();
              return FadeTransition(
                opacity: animation,
                child: Transform(
                    transform: Matrix4.translationValues(
                        0.0, 30 * (1.0 - animation.value), 0.0),
                    child: Container(
                        height: 400,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                              image: NetworkImage(widget.imgsUrl![
                                      productController.selectedImage.value]
                                  .toString()),
                              fit: BoxFit.cover),
                        ))));}),
        SizedBox(
          width: width,
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: sc,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      List<Widget>.generate(widget.imgsUrl!.length, (index) {
                    animationController!.forward();
                    return imgCell(
                        index,
                        width,
                        Tween<double>(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                                parent: animationController!,
                                curve: Interval(
                                    (1 / widget.imgsUrl!.length) * index, 1.0,
                                    curve: Curves.fastOutSlowIn))));
                  }),
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

  Widget imgCell(int idx, double width, Animation<double> animation) {
    return GestureDetector(
        onTap: () {
          productController.changeImg(idx);
        },
        child: FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: Container(
              height: 150,
              width: width / 3,
              decoration: BoxDecoration(
                color: Colors.grey,
                  border: const Border(right: BorderSide(color: Colors.white)),
                  image: DecorationImage(
                      image: NetworkImage(
                        widget.imgsUrl![idx].toString(),
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
        ));
  }
}
