import 'package:flutter/material.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/components/landing/gradient_text.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class LandingInfoPage extends StatelessWidget {
  const LandingInfoPage({Key? key}) : super(key: key);

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
                            'Kto Sme?',
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
                        ],
                      ),
                      Container(
                          height: 400,
                          width: 700,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF6078ea).withOpacity(0.3),
                                offset: const Offset(0, 8),
                                blurRadius: 8,
                              )
                            ],
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                                image:
                                    AssetImage("assets/images/firma_sirka.jpg"),
                                fit: BoxFit.cover),
                          )),
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
              Center(
                child: Column(
                  children: [
                    const GradientText(
                      'Kto Sme?',
                      style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
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
                    Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6078ea).withOpacity(0.3),
                              offset: const Offset(0, 8),
                              blurRadius: 8,
                            )
                          ],
                          borderRadius: BorderRadius.circular(30),
                          image: const DecorationImage(
                              image: AssetImage("assets/images/firma_sirka.jpg"),
                              fit: BoxFit.cover),
                        )),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
