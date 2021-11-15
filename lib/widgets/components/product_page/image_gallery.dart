import 'package:flutter/material.dart';

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
      (index) => InkWell(
        onTap: () {},
        child: SizedBox(
          height: 100,
          width: 100,
          child: Image.network(widget.imgsUrl![index].toString(), fit: BoxFit.cover),
        ),
      ),
    );
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            child: Image.network(widget.imgsUrl![0].toString(), fit: BoxFit.cover),
          ),
          Row(
            children: _gallery,
          )
        ],
      ),
    );
  }
}
