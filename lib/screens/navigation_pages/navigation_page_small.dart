import 'package:flutter/material.dart';
import 'package:webstore/screens/main/home_page.dart';
import 'package:webstore/widgets/components/base/nav_bar.dart';

class NavigationPageSmall extends StatefulWidget {
  const NavigationPageSmall({Key? key}) : super(key: key);

  @override
  _NavigationPageSmallState createState() => _NavigationPageSmallState();
}

class _NavigationPageSmallState extends State<NavigationPageSmall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: const [
        NavBar(),
        HomePage(),
      ],
    ));
  }
}
