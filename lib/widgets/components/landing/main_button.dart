import 'package:flutter/material.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class MainButton extends StatelessWidget {
  final List<Color>? colors;
  final String? text;
  final bool? isOnLight;
  const MainButton({Key? key, this.colors, this.text, this.isOnLight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 50,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: colors!,
              begin: Alignment.bottomRight,
              end: Alignment.topLeft),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6078ea).withOpacity(0.3),
              offset: const Offset(0, 8),
              blurRadius: 8,
            )
          ]),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isOnLight!
                ? const Icon(Icons.play_circle_filled, color: Color(0xFFb0BFDE))
                : Container(),
            CustomText(
                text: text,
                size: 16,
                color: isOnLight! ? const Color(0xFF7C8FB5) : Colors.white),
          ],
        ),
      ),
    );
  }
}
