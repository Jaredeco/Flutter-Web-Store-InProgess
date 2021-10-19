import 'package:flutter/material.dart';
import 'package:webstore/screens/main/home_page.dart';
import 'package:webstore/widgets/components/base/nav_bar.dart';

class NavigationPageLarge extends StatefulWidget {
  const NavigationPageLarge({Key? key}) : super(key: key);

  @override
  _NavigationPageLargeState createState() => _NavigationPageLargeState();
}

class _NavigationPageLargeState extends State<NavigationPageLarge> {
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


