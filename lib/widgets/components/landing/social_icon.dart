import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final IconData? icon;
  const SocialIcon({Key? key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.only(left: 20),
      decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 10),
              blurRadius: 10,
            )
          ]),
      child: Center(
        child: Icon(icon, color: const Color(0xFFD1DBEA)),
      ),
    );
  }
}
