import 'package:flutter/material.dart';

class FooterLarge extends StatelessWidget {
  const FooterLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
    );
  }
}
