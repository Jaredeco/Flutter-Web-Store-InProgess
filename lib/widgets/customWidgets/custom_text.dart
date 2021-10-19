import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign; 
  final EdgeInsetsGeometry? padding;

  const CustomText({Key? key, this.text, this.size, this.color, this.weight, this.textAlign, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Text(
        text!,style: TextStyle(fontSize: size ?? 16, color: color ?? Colors.black, fontWeight: weight ?? FontWeight.normal),
        textAlign: textAlign,
      ),
    );
  }
}