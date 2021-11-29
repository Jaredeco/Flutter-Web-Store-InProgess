import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/firma_sirka.jpg"),
                  fit: BoxFit.cover),
            )),
        Center(
          child: MaterialButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/shop");
            },
            color: Colors.transparent,
            textColor: Colors.white,
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 45,
            ),
            padding: const EdgeInsets.all(16),
            shape: const CircleBorder(),
          ),
        )
      ],
    );
  }
}
