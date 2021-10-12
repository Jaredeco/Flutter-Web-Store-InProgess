import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: const Text(
        "American",
        textAlign: TextAlign.center,
      ),
    );
  }
}
