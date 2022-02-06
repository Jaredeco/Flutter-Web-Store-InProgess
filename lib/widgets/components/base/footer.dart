import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webstore/widgets/components/landing/main_button.dart';
import 'package:webstore/widgets/customWidgets/custom_textfield.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF23BCBA),
            Color(0xFF45E994),
          ], begin: Alignment.bottomRight, end: Alignment.topLeft),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: InkWell(
                    onTap: () => Navigator.of(context).pushNamed("/"),
                    child: SizedBox(
                        height: 90,
                        width: 150,
                        child: Image.asset("assets/images/logo_vego.png")),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    MainButton(
                      onTap: () async {
                        await launch("https://www.instagram.com/vegoegmt/");
                      },
                      text: "Sledujte Nás!",
                      colors: const [Colors.white, Colors.white],
                      isSocial: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MainButton(
                      onTap: () {},
                      text: "Kontaktujte Nás!",
                      colors: const [Colors.white, Colors.white],
                      isSocial: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      width: 400,
                      txtIcon: Icons.email,
                      txtText: "idsji",
                      txtController: TextEditingController(),
                      maxLines: true,
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
