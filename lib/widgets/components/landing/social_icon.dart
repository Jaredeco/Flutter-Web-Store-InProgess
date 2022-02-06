import 'package:flutter/material.dart';

class ButtonDown extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onTap;
  const ButtonDown({Key? key, this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
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
          child: Icon(icon, color: const Color(0xFF45E994), size: 40,),
        ),
      ),
    );
  }
}
