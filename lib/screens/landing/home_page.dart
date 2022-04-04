import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:parallax_animation/parallax_animation.dart';
import 'package:webstore/screens/landing/landing_pages/info_page.dart';
import 'package:webstore/screens/landing/landing_pages/landing_page.dart';

class HomePage extends StatefulWidget {
  final bool? scrollInfo;
  const HomePage({Key? key, this.scrollInfo}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      if (widget.scrollInfo != null) {
        _pageController.animateToPage(_pageController.page!.toInt() + 1,
            duration: const Duration(milliseconds: 700), curve: Curves.easeIn);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
