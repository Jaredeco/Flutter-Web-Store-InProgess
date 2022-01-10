import 'package:flutter/material.dart';
import 'package:webstore/widgets/components/landing/gradient_text_noanm.dart';
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
            GradientTextNoAnm(
              text: "Error 404",
              style: TextStyle(fontSize: 80),
            ),
            CustomText(
              textAlign: TextAlign.center,
              text: "Page Not Found!",
              color: Color(0xFF7C8FB5),
              size: 60,
            ),
          ],
        ),
      ),
    );
  }
}
