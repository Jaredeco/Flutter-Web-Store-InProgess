import 'package:flutter/material.dart';
import 'package:parallax_animation/parallax_animation.dart';
import 'package:webstore/screens/landing/landing_pages/info_page.dart';
import 'package:webstore/screens/landing/landing_pages/landing_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [const LandingPage(), const LandingInfoPage()];
    return ParallaxArea(
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _pages.length,
        itemBuilder: (context, index) {
          return ParallaxWidget(child: _pages[index]);
        },
      ),
    );
  }
}
