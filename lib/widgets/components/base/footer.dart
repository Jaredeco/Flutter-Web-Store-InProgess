import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webstore/screens/main/base/responsive_ui.dart';
import 'package:webstore/widgets/components/landing/gradient_text.dart';
import 'package:webstore/widgets/components/landing/social_icon.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MediaQuery.of(context).size.width >= largePageSize
                ? const GradientText(
                    text: "Kontaktujte Nás!",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  )
                : const CustomText(
                    textAlign: TextAlign.center,
                    text: "Kontaktujte Nás!",
                    size: 40,
                    color: Color(0xFF45E994),
                    weight: FontWeight.bold),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.email,
                  color: Color(0xFFb0BFDE),
                ),
                CustomText(
                  padding: EdgeInsets.only(left: 10),
                  text: "vego.egmt@gmail.com",
                  color: Color(0xFFb0BFDE),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonDown(
              icon: FontAwesomeIcons.instagram,
              size: 25,
              color: const Color(0xFF45E994),
              onTap: () async {
                await launch("https://www.instagram.com/vegoegmt/");
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.copyright,
                  color: Color(0xFFb0BFDE),
                ),
                CustomText(
                  padding: EdgeInsets.only(left: 10),
                  text: "Developed and Designed by Ján Redecha.",
                  color: Color(0xFFb0BFDE),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed("/"),
              child: SizedBox(
                  height: 90,
                  width: 150,
                  child: Image.asset("assets/images/logo_vego.png")),
            ),
          ],
        ),
      ),
    );
  }
}
