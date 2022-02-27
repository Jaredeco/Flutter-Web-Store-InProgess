import 'package:flutter/material.dart';
import 'custom_text.dart';

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
      child: Container(
        decoration: BoxDecoration(
            gradient: bgColor == null
                ? const LinearGradient(colors: [
                    Color(0xFF23BCBA),
                    Color(0xFF45E994),
                  ], begin: Alignment.bottomRight, end: Alignment.topLeft)
                : LinearGradient(
                    colors: [bgColor!, bgColor!],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6078ea).withOpacity(0.3),
                offset: const Offset(0, 8),
                blurRadius: 8,
              )
            ]),
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
