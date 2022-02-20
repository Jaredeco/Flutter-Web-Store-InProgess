import 'package:flutter/material.dart';
import 'package:parallax_animation/parallax_animation.dart';
import 'package:webstore/screens/landing/landing_pages/info_page.dart';
import 'package:webstore/screens/landing/landing_pages/landing_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController();
    final List<Widget> _pages = [
      LandingPage(
        pageController: _pageController,
      ),
      const LandingInfoPage()
    ];
    return ParallaxArea(
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: _pages.length,
        itemBuilder: (context, index) {
          return ParallaxWidget(child: _pages[index]);
        },
      ),
    );
  }
}
