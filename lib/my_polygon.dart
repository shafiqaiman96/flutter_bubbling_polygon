import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'my_painter.dart';

class MyPolygon extends StatelessWidget {
  final int left, top, radius, radian;

  const MyPolygon({
    super.key,
    required this.left,
    required this.top,
    required this.radius,
    required this.radian,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(
        sides: 8,
        radius: radius.toDouble(),
        radian: radian.toDouble(),
      ),
      child: Container(),
    )
        .animate(onPlay: (controller) => controller.repeat())
        .fadeIn(duration: 3000.ms)
        .rotate(begin: .3, end: 1)
        .scaleXY(duration: 3000.ms, begin: .2, end: .9, curve: Curves.easeOut)
        .then(delay: 10.ms)
        .fadeOut(duration: 3000.ms)
        .scaleXY(duration: 3000.ms, begin: .9, end: .2, curve: Curves.easeIn)
        .rotate(begin: 1, end: .3);
  }
}
