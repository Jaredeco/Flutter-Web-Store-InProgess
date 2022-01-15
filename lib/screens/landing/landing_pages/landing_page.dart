import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                    const SizedBox(height: 100),
                    const Center(
                        child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFF45E994),
                      size: 40,
                    ))
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    const CustomText(
                        text: 'VEGO',
                        size: 60,
                        color: Color(0xFF45E994),
                        weight: FontWeight.bold),
                    const CustomText(
                      textAlign: TextAlign.center,
                      text: "Školská Firma",
                      color: Color(0xFF7C8FB5),
                      size: 30,
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 550),
                      child: const CustomText(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        textAlign: TextAlign.center,
                        text:
                            "Introducing the comma three devkit. The comma three is 4th generation custom hardware designed to live in your car. It has dual cam 360° vision, plus a narrow cam to spot objects far off in the distance.",
                        size: 14,
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
                    const SizedBox(height: 20),
                    const Center(
                        child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFF45E994),
                      size: 40,
                    ))
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
