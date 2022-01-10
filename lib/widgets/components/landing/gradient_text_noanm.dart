import 'package:flutter/material.dart';

class GradientTextNoAnm extends StatefulWidget {
  const GradientTextNoAnm({
    Key? key,
    this.text,
    this.style,
  }) : super(key: key);

  final String? text;
  final TextStyle? style;

  @override
  State<GradientTextNoAnm> createState() => _GradientTextNoAnmState();
}

class _GradientTextNoAnmState extends State<GradientTextNoAnm> {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [Color(0xFF23BCBA), Color(0xFF45E994)],
      ).createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        widget.text!,
        style: widget.style,
        textAlign: TextAlign.center,
      ),
    );
  }
}
