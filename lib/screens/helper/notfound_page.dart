import 'package:flutter/material.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CustomText(
                text: "Error 404",
                size: 70,
                color: Color(0xFF45E994),
                weight: FontWeight.bold),
            CustomText(
              textAlign: TextAlign.center,
              text: "Page Not Found!",
              color: Color(0xFF7C8FB5),
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
