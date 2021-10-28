import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webstore/controllers/product_controller.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/components/home/product_card.dart';
import 'package:webstore/constants/controllers.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveUi(
      largeWidgets: [
        Padding(
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
        ),
      ],
    );
  }
}
