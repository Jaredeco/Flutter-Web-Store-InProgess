import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webstore/screens/navigation_pages/navigation_page_large.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:webstore/screens/navigation_pages/navigation_page_small.dart';
import 'package:webstore/widgets/components/responsive_ui.dart';

void main() async {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WebStore',
      theme: ThemeData(
        primarySwatch: primaryBlack,
      ),
      home: const ResponsiveUi(
        largePage: NavigationPageLarge(),
        smallPage: NavigationPageSmall(),
      ),
    );
  }
}

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;
