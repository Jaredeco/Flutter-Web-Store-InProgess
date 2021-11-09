import 'package:flutter/material.dart';

class ImageGallery extends StatefulWidget {
  const ImageGallery({ Key? key }) : super(key: key);

  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  child: Image.asset("assets/images/product.jpg",
                      fit: BoxFit.cover),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset("assets/images/product.jpg",
                            fit: BoxFit.cover),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset("assets/images/product.jpg",
                            fit: BoxFit.cover),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset("assets/images/product.jpg",
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}