import 'package:flutter/material.dart';
import 'package:webstore/widgets/components/filter_item.dart';
import 'package:webstore/widgets/components/home/product_card.dart';
import 'package:webstore/widgets/customWidgets/custom_textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomTextField(
          txtIcon: Icons.search,
          txtController: _textEditingController,
          txtText: "Search",
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              // FilterItem(),
            ],
          ),
        ),
        Wrap(
          direction: Axis.horizontal,
          children: const [
            ProductCard(title: "Product", price:100),
            ProductCard(title: "Product", price:100),
            ProductCard(title: "Product", price:100),
            ProductCard(title: "Product", price:100),
            ProductCard(title: "Product", price:100),
            ProductCard(title: "Product", price:100),
          ],
        )
      ],
    );
  }
}
