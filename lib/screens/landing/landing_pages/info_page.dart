import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
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
                        spawnMinSpeed: 100,
                        spawnMaxSpeed: 150)),
                vsync: this,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const GradientText(
                          'Kto Sme?',
                          style: TextStyle(
                              fontSize: 80, fontWeight: FontWeight.bold),
                        ),
                        const CustomText(
                          textAlign: TextAlign.center,
                          text: "Školská Firma",
                          color: Color(0xFF7C8FB5),
                          size: 60,
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 550),
                          child: const CustomText(
                            textAlign: TextAlign.center,
                            text:
                                "Introducing the comma three devkit. The comma three is 4th generation custom hardware designed to live in your car. It has dual cam 360° vision, plus a narrow cam to spot objects far off in the distance.",
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
                        particleCount: 50,
                        spawnMinSpeed: 100,
                        spawnMaxSpeed: 150)),
                vsync: this,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const GradientText(
                      'Kto Sme?',
                      style:
                          TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                    ),
                    const CustomText(
                      textAlign: TextAlign.center,
                      text: "Školská Firma",
                      color: Color(0xFF7C8FB5),
                      size: 45,
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 550),
                      child: const CustomText(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        textAlign: TextAlign.center,
                        text:
                            "Introducing the comma three devkit. The comma three is 4th generation custom hardware designed to live in your car. It has dual cam 360 vision, plus a narrow cam to spot objects far off in the distance.",
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
                              image:
                                  AssetImage("assets/images/firma_sirka.jpg"),
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
