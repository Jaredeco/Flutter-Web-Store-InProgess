import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController txtController;
  final IconData txtIcon;
  final String txtText;
  final bool? isObscure;

  const CustomTextField(
      {Key? key,
      required this.txtController,
      required this.txtIcon,
      required this.txtText,
      this.isObscure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: Get.width * 0.4,
          margin: const EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: TextField(
              obscureText: isObscure ?? false,
              controller: txtController,
              decoration: InputDecoration(
                  icon: Icon(txtIcon, color: Colors.black),
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: txtText, hintStyle: const TextStyle(color: Colors.black)),
            ),
          ),
        ),
      ],
    );
  }
}
