import 'package:flutter/material.dart';
import 'package:webstore/widgets/components/home/filter_item.dart';
import 'package:webstore/widgets/components/home/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        direction: Axis.horizontal,
        children: const [
          ProductCard(title: "Product", price: 100),
          ProductCard(title: "Product", price: 100),
          ProductCard(title: "Product", price: 100),
          ProductCard(title: "Product", price: 100),
          ProductCard(title: "Product", price: 100),
          ProductCard(title: "Product", price: 100),
        ],
      ),
    );
  }
}
