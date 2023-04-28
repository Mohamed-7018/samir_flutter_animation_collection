import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:samir_flutter_ui_challenge/challenge_1_animated_coffee_cup/utils/values.dart';

class DunKinPainter extends CustomPainter {
  final double? cupProgress;
  final double? coverProgress;
  final double? coverTopProgress;
  final double? strawProgress;
  final double? shadowProgress;
  final double? topProgress;

  DunKinPainter(
      {this.cupProgress,
      this.coverProgress,
      this.topProgress,
      this.coverTopProgress,
      this.strawProgress,
      this.shadowProgress});

  @override
  void paint(Canvas canvas, Size size) {
    final coverPaint = Paint()
      ..strokeWidth = topProgress == 1000 ? 7 : 5
      ..color = ChallengeOneAppColors.kScaffoldLight
      ..style = PaintingStyle.stroke;

    final curvesPaint = Paint()
      ..strokeWidth = 5
      ..color = ChallengeOneAppColors.kScaffoldLight
      ..style = PaintingStyle.stroke;

    final strawPaint = Paint()
      ..strokeWidth = 4
      ..color = ChallengeOneAppColors.kScaffoldLight
      ..style = PaintingStyle.stroke;

    final footerPaint = Paint()
      ..strokeWidth = 5
      ..color = ChallengeOneAppColors.logoSemiBrown
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.solid, convertRadiusToSigma(1));

    //draw straw
    final straw = Path();
    straw.moveTo(size.width / 2.5, 85);
    straw.relativeLineTo(30, 20);
    straw.relativeLineTo(-0, 30);
    straw.relativeLineTo(10, -0);
    straw.relativeLineTo(1, -35);
    straw.relativeLineTo(-35, -20);
    straw.close();
    //Animate straw
    animatePath(straw, strawPaint, canvas, strawProgress!);

    //draw cup cover
    final cupCover = Path()
      ..moveTo(size.width / 5.5, 250)
      ..relativeCubicTo(50 - 15, -175, 250, -130, 250, -0)
      ..close();
    // Animate cup
    animatePath(cupCover, coverPaint, canvas, coverTopProgress!);

    //draw cup first line
    final cupTop = Path();
    cupTop.moveTo(54, 250);
    cupTop.relativeLineTo(300, 0);
    cupTop.relativeLineTo(0, 20);
    cupTop.relativeLineTo(-300, 0);
    cupTop.close();
    //Animate cup top layer
    animatePath(cupTop, curvesPaint, canvas, coverProgress!);

    //draw cup second line
    final cupTop2 = Path();
    cupTop2.moveTo(size.width / 5.5, 270);
    cupTop2.relativeLineTo(250, 0);
    cupTop2.relativeLineTo(0, 20);
    cupTop2.relativeLineTo(-250, 0);
    cupTop2.close();
    //Animate second cup top layer
    animatePath(cupTop2, curvesPaint, canvas, coverTopProgress!);

    //draw cup body
    final cupBody = Path();
    cupBody.moveTo(size.width / 5.2, 292);
    cupBody.relativeLineTo(30, 275);
    cupBody.relativeLineTo(179, 0);
    cupBody.relativeLineTo(30, -275);
    //Animate Cup body
    animatePath(cupBody, curvesPaint, canvas, cupProgress!);

    //draw first footer
    final footer = Path();
    footer.moveTo(120, 565.0);
    footer.relativeLineTo(158.0, 0);
    footer.relativeLineTo(0, 20);
    footer.relativeLineTo(-158.0, 0);
    footer.close();
    //Animate cup footer
    animatePath(footer, footerPaint, canvas, shadowProgress!);
  }

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  animatePath(Path path, Paint paint, Canvas canvas, double progress) {
    PathMetrics shadowMetrics = path.computeMetrics();
    for (PathMetric pathMetric in shadowMetrics) {
      Path extractPath = pathMetric.extractPath(
        0.0,
        pathMetric.length * progress,
      );
      canvas.drawPath(extractPath, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
