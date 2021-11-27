import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Color? txtColor;
  final double? txtSize;
  final Color? bgColor;
  final Color? shadowColor;
  final VoidCallback? onTap;

  const CustomButton(
      {Key? key,
      required this.text,
      this.txtColor,
      this.txtSize,
      this.bgColor,
      this.shadowColor,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: PhysicalModel(
        color: bgColor ?? Colors.black,
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: 200,
            child: Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: CustomText(
                text: text!,
                color: txtColor ?? Colors.white,
                size: txtSize ?? 20,
                weight: FontWeight.normal,
              ),
            )),
      ),
    );
  }
}
