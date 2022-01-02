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
    return ResponsiveUi(
      landing: true,
      largeWidgets: [
        Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Positioned(
                  left: -180,
                  bottom: -180,
                  child: Image.asset("assets/images/leaff.png")),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 120, vertical: 120),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const GradientText(
                            'VEGO',
                            style: TextStyle(
                                fontSize: 80, fontWeight: FontWeight.bold),
                          ),
                          const CustomText(
                            text: "Školská Firma",
                            color: Color(0xFF7C8FB5),
                            size: 60,
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 550),
                            child: const CustomText(
                              text:
                                  "Oskdoskdsodkskddsd dsokdosdk okds ksokdksodk okdosf  eifjeijf.",
                              size: 16,
                              color: Color(0xFF7C8FB5),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              MainButton(
                                onTap: () =>
                                    Navigator.of(context).pushNamed("/shop"),
                                text: "Explore Products",
                                colors: const [
                                  Color(0xFF23BCBA),
                                  Color(0xFF45E994),
                                ],
                                isOnLight: false,
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              MainButton(
                                onTap: () {},
                                text: "Watch Now",
                                colors: const [Colors.white, Colors.white],
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
                    ],
                  )),
            ],
          ),
        )
      ],
      smallWidgets: [
        Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Positioned(
                  left: -180,
                  bottom: -180,
                  child: Image.asset("assets/images/leaff.png")),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const GradientText(
                        'VEGO',
                        style: TextStyle(
                            fontSize: 80, fontWeight: FontWeight.bold),
                      ),
                      const CustomText(
                        text: "Školská Firma",
                        color: Color(0xFF7C8FB5),
                        size: 60,
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 550),
                        child: const CustomText(
                          text:
                              "Oskdoskdsodkskddsd dsokdosdk okds ksokdksodk okdosf  eifjeijf.",
                          size: 16,
                          color: Color(0xFF7C8FB5),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      MainButton(
                        onTap: () => Navigator.of(context).pushNamed("/shop"),
                        text: "Explore Products",
                        colors: const [
                          Color(0xFF23BCBA),
                          Color(0xFF45E994),
                        ],
                        isOnLight: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MainButton(
                        onTap: () {},
                        text: "Watch Now",
                        colors: const [Colors.white, Colors.white],
                        isOnLight: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SocialIcon(
                            icon: FontAwesomeIcons.instagram,
                          ),
                          SocialIcon(
                            icon: FontAwesomeIcons.facebook,
                          ),
                        ],
                      ),
                      // const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
