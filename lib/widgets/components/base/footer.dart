import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFF23BCBA),
          Color(0xFF45E994),
        ], begin: Alignment.bottomRight, end: Alignment.topLeft),
      ),
    );
  }
}
