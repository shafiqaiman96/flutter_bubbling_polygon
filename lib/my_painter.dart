import 'dart:math' as math;
import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  final double? sides;
  final double? radius;
  final double? radian;
  MyPainter({this.sides, this.radius, this.radian});

  @override
  void paint(Canvas canvas, Size size) {
    /* JUST FOR LEARNING PURPOSE

      // DRAW LINE
      final paint = Paint()
        ..color = Colors.purple
        ..strokeWidth = 5
        ..strokeCap = StrokeCap.round;

      Offset startingPoint = Offset(0, size.height / 2);
      Offset endingPoint = Offset(size.width, size.height / 2);

      canvas.drawLine(startingPoint, endingPoint, paint);

      // DRAW CIRCLE
      final paint = Paint()
        ..color = Colors.purple
        ..strokeWidth = 5
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

      Offset center = Offset(size.width / 2, size.height / 2);

      canvas.drawCircle(center, 100, paint);
      
  */
    // DRAW POLYGON
    if (sides != null || radius != null || radian != null) {
      final paint = Paint()
        ..color =
            Colors.purple.withOpacity(radius! / ((radius! < 10) ? 10 : 100))
        ..strokeWidth = ((radius! < 10) ? 1 : 2)
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

      final path = Path();
      final angle = (math.pi * 2) / sides!;

      Offset center = Offset(size.width / 2, size.height / 2);
      Offset startPoint =
          Offset(radius! * math.cos(radian!), radius! * math.sin(radian!));

      path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

      for (int i = 1; i <= sides!; i++) {
        double x = radius! * math.cos(radian! + angle * i) + center.dx;
        double y = radius! * math.sin(radian! + angle * i) + center.dy;
        path.lineTo(x, y);
      }
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


/* JUST FOR LEARNING PURPOSE (DRAW CIRCLE AND ARC)

  class MyPainter extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
      final rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
      const startAngle = pi / 10; // start at 12 o'clock
      const sweepAngle = 12 * pi / 7; // 6/7 of a full circle
      final path = Path()
        ..moveTo(size.width / 2, size.height / 2)
        ..arcTo(rect, startAngle, sweepAngle, false)
        ..close();

      // get 1/6 of circle only
      // canvas.drawPath(path, Paint()..color = Colors.blue);
      // const startAngle = -pi / 2; // start at 12 o'clock
      // const sweepAngle = pi / 3; // 60 degrees
      // final path = Path()
      //   ..moveTo(size.width / 2, size.height / 2)
      //   ..arcTo(rect, startAngle, sweepAngle, false)
      //   ..close();
      canvas.drawPath(path, Paint()..color = Colors.red);
    }

    @override
    bool shouldRepaint(MyPainter oldDelegate) => false;
  }
*/