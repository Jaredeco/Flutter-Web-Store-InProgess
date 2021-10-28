import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Color? txtColor;
  final Color? bgColor;
  final Color? shadowColor;
  final VoidCallback? onTap;

  const CustomButton(
      {Key? key,
      required this.text,
      this.txtColor,
      this.bgColor,
      this.shadowColor,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: PhysicalModel(
        color: bgColor ?? Colors.black,
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
            width: Get.width / 1.2,
            child: Container(
              margin: const EdgeInsets.all(14),
              alignment: Alignment.center,
              child: CustomText(
                text: text!,
                color: txtColor ?? Colors.white,
                size: 22,
                weight: FontWeight.normal,
              ),
            )),
      ),
    );
  }
}
