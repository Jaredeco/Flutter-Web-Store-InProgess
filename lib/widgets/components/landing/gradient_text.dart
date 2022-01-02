import 'package:flutter/material.dart';

class GradientText extends StatefulWidget {
  const GradientText(
    this.text, {
    this.style,
  });

  final String text;
  final TextStyle? style;

  @override
  State<GradientText> createState() => _GradientTextState();
}

class _GradientTextState extends State<GradientText>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController!
      ..addListener(() {
        setState(() {});
      }));
    _animationController!.forward();
    _animationController!.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => LinearGradient(
        stops: [
          _animation!.value,
          _animation!.value + 0.3,
        ],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: const [Color(0xFF23BCBA), Color(0xFF45E994)],
      ).createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(widget.text, style: widget.style),
    );
  }
}
