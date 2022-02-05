import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:webstore/constants/global.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/components/landing/gradient_text.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class LandingInfoPage extends StatefulWidget {
  const LandingInfoPage({Key? key}) : super(key: key);

  @override
  State<LandingInfoPage> createState() => _LandingInfoPageState();
}

class _LandingInfoPageState extends State<LandingInfoPage>
    with TickerProviderStateMixin {
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
              AnimatedBackground(
                behaviour: RandomParticleBehaviour(
                    options: const ParticleOptions(
                        baseColor: Color(0xFF45E994),
                        spawnMinSpeed: minParSpeed,
                        spawnMaxSpeed: maxParSpeed)),
                vsync: this,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const GradientText(
                          text: 'Kto Sme?',
                          style: TextStyle(
                              fontSize: 80, fontWeight: FontWeight.bold),
                        ),
                        const CustomText(
                          textAlign: TextAlign.center,
                          text: "Školská Firma",
                          color: Color(0xFF7C8FB5),
                          size: 60,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: const CustomText(
                            textAlign: TextAlign.center,
                            text: landingInfoText,
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
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("assets/images/firma_sirka.jpg",
                              fit: BoxFit.cover),
                        ),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6078ea).withOpacity(0.3),
                              offset: const Offset(0, 8),
                              blurRadius: 8,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ],
                ),
              ),
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
              AnimatedBackground(
                behaviour: RandomParticleBehaviour(
                    options: const ParticleOptions(
                        baseColor: Color(0xFF45E994),
                        particleCount: smallParCount,
                        spawnMinSpeed: minParSpeed,
                        spawnMaxSpeed: maxParSpeed)),
                vsync: this,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      const CustomText(
                          text: 'Kto Sme?',
                          size: 70,
                          color: Color(0xFF45E994),
                          weight: FontWeight.bold),
                      const CustomText(
                        textAlign: TextAlign.center,
                        text: "Školská Firma",
                        color: Color(0xFF7C8FB5),
                        size: 30,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const CustomText(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          textAlign: TextAlign.center,
                          text: landingInfoText,
                          size: 16,
                          color: Color(0xFF7C8FB5),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset("assets/images/firma_sirka.jpg",
                                fit: BoxFit.cover),
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF6078ea).withOpacity(0.3),
                                offset: const Offset(0, 8),
                                blurRadius: 8,
                              )
                            ],
                            borderRadius: BorderRadius.circular(10),
                          )),
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
