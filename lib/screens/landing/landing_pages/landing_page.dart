import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webstore/widgets/components/landing/gradient_text.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/components/landing/main_button.dart';
import 'package:webstore/widgets/components/landing/social_icon.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveUi(landing: true, largeWidgets: [
      Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
                left: -180,
                bottom: -180,
                child: Image.asset("assets/images/leaff.png")),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 120),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const GradientText(
                          'Hello',
                          style: TextStyle(
                              fontSize: 80, fontWeight: FontWeight.bold),
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                              colors: [
                                Color(0xFF23BCBA),
                                Color(0xFF45E994),
                              ]),
                        ),
                        const CustomText(
                          text: "Mission",
                          color: Color(0xFF7C8FB5),
                          size: 80,
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 550),
                          child: const CustomText(
                            text:
                                "oskdoskdsodkskddsd dsokdosdk okds ksokdksodk okdos",
                            size: 16,
                            color: Color(0xFF7C8FB5),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: const [
                            MainButton(
                              text: "SIGN UP FOR FREE",
                              colors: [
                                Color(0xFF23BCBA),
                                Color(0xFF45E994),
                              ],
                              isOnLight: false,
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            MainButton(
                              text: "Watch Now",
                              colors: [Colors.white, Colors.white],
                              isOnLight: true,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: const [
                            SocialIcon(
                              icon: FontAwesomeIcons.instagram,
                            ),
                            SocialIcon(
                              icon: FontAwesomeIcons.facebook,
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                    // Image.asset("assets/images/main_logo.png")
                  ],
                )),
          ],
        ),
      )
    ]);
  }
}
