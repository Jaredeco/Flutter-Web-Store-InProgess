import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webstore/widgets/components/landing/gradient_text.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/components/landing/main_button.dart';
import 'package:webstore/widgets/components/landing/social_icon.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';
import 'package:webstore/constants/global.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const GradientText(
                      text: 'VEGO',
                      style:
                          TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                    ),
                    const CustomText(
                      textAlign: TextAlign.center,
                      text: "Školská Firma",
                      color: Color(0xFF7C8FB5),
                      size: 65,
                    ),
                    const SizedBox(height: 20,),
                    const SizedBox(
                      width: 600,
                      child: CustomText(
                        textAlign: TextAlign.center,
                        text: landingText,
                        size: 16,
                        color: Color(0xFF7C8FB5),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MainButton(
                          onTap: () => Navigator.of(context).pushNamed("/shop"),
                          text: "Objaviť Produkty",
                          colors: const [
                            Color(0xFF23BCBA),
                            Color(0xFF45E994),
                          ],
                          isSocial: false,
                        ),
                        const SizedBox(
                          width: 45,
                        ),
                        MainButton(
                          onTap: () async {
                            await launch("https://www.instagram.com/vegoegmt/");
                          },
                          text: "Sledujte Nás!",
                          colors: const [Colors.white, Colors.white],
                          isSocial: true,
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    ButtonDown(
                      icon: Icons.keyboard_arrow_down,
                      onTap: () async {},
                    ),
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
                      SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                      const CustomText(
                          text: 'VEGO',
                          size: 65,
                          color: Color(0xFF45E994),
                          weight: FontWeight.bold),
                      const CustomText(
                        textAlign: TextAlign.center,
                        text: "Školská Firma",
                        color: Color(0xFF7C8FB5),
                        size: 30,
                      ),
                      const SizedBox(height: 20,),
                       SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const CustomText(
                          textAlign: TextAlign.center,
                          text: landingText,
                          size: 16,
                          color: Color(0xFF7C8FB5),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      MainButton(
                        onTap: () => Navigator.of(context).pushNamed("/shop"),
                        text: "Objaviť Produkty",
                        colors: const [
                          Color(0xFF23BCBA),
                          Color(0xFF45E994),
                        ],
                        isSocial: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MainButton(
                        onTap: () async {
                          await launch("https://www.instagram.com/vegoegmt/");
                        },
                        text: "Sledujte Nás!",
                        colors: const [Colors.white, Colors.white],
                        isSocial: true,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      ButtonDown(
                        icon: Icons.keyboard_arrow_down,
                        onTap: () async {},
                      ),
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
