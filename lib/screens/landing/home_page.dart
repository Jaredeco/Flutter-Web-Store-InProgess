import 'package:flutter/material.dart';
import 'package:opscroll_web/opscroll_web.dart';
import 'package:webstore/screens/landing/landing_pages/info_page.dart';
import 'package:webstore/screens/landing/landing_pages/landing_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpscrollWeb(
      onePageChildren: const [
        LandingPage(),
        LandingInfoPage(),
      ],
      pageController: PageController(),
      scrollCurve: Curves.easeIn,
      scrollSpeed: const Duration(milliseconds: 900),
      floatingButtonBackgroundColor: Colors.white,
      floatingButtonSplashColor: Colors.white,
      isFloatingButtonActive: false,
      isTouchScrollingActive: false,
      scrollingAnimationOptions: ScrollingAnimationOptions.Default,
      scrollDirection: Axis.vertical,
    );
  }
}
