import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class MainButton extends StatelessWidget {
  final Function()? onTap;
  final List<Color>? colors;
  final String? text;
  final bool? isSocial;
  const MainButton(
      {Key? key, this.colors, this.text, this.isSocial, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap!,
      child: Container(
        width: 180,
        height: 50,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: colors!,
                begin: Alignment.bottomRight,
                end: Alignment.topLeft),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6078ea).withOpacity(0.3),
                offset: const Offset(0, 8),
                blurRadius: 8,
              )
            ]),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isSocial!
                  ? const Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: Icon(FontAwesomeIcons.instagram,
                          color: Color(0xFFb0BFDE)),
                    )
                  : Container(),
              CustomText(
                  text: text,
                  size: 16,
                  color: isSocial! ? const Color(0xFF7C8FB5) : Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
