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
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = 770;
    double point = 0;
    double mv = 0.4;

    final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(
            parent: animationController!,
            curve: Interval((1 / widget.imgsUrl!.length + 1) * 0, 1.0,
                curve: Curves.fastOutSlowIn)));

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedBuilder(
            animation: animationController!,
            builder: (BuildContext context, Widget? child) {
              return FadeTransition(
                  opacity: animation,
                  child: Transform(
                      transform: Matrix4.translationValues(
                          0.0, 30 * (1.0 - animation.value), 0.0),
                      child: GetX<ProductController>(builder: (_) {
                        animationController!.forward();
                        return Container(
                            height: 400,
                            width: width,
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              image: DecorationImage(
                                  image: NetworkImage(widget.imgsUrl![
                                          productController.selectedImage.value]
                                      .toString()),
                                  fit: BoxFit.cover),
                            ));
                      })));
            }),
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
                          if (point - mv >= 0) {
                            point -= mv;
                            sc.animateTo(sc.position.maxScrollExtent * point,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.fastOutSlowIn);
                          }
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                    IconButton(
                        onPressed: () {
                          if (point + mv <= 1) {
                            point += mv;
                            sc.animateTo(sc.position.maxScrollExtent * point,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.fastOutSlowIn);
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
    return AnimatedBuilder(
        animation: animationController!,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
              opacity: animation,
              child: Transform(
                  transform: Matrix4.translationValues(
                      0.0, 30 * (1.0 - animation.value), 0.0),
                  child: GestureDetector(
                      onTap: () {
                        productController.changeImg(idx);
                      },
                      child: Container(
                        height: 150,
                        width: width / 3,
                        decoration: BoxDecoration(
                            color: Colors.grey[50],
                            border: const Border(
                                right: BorderSide(color: Colors.white)),
                            image: DecorationImage(
                                image: NetworkImage(
                                  widget.imgsUrl![idx].toString(),
                                ),
                                fit: BoxFit.cover)),
                      ))));
        });
  }
}
