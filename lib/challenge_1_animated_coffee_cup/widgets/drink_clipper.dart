import 'package:flutter/material.dart';

import '../utils/values.dart';

class DrinkClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path4 = Path();
    path4.moveTo(size.width / 5.2, ChallengeOneAppSizes.size_292);
    path4.relativeLineTo(
        ChallengeOneAppSizes.size_30, ChallengeOneAppSizes.size_275);
    path4.relativeLineTo(
        ChallengeOneAppSizes.size_179, ChallengeOneAppSizes.size_0);
    path4.relativeLineTo(
        ChallengeOneAppSizes.size_30, -ChallengeOneAppSizes.size_275);
    return path4;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path1 = Path()
      ..moveTo(
          size.width /
              (ChallengeOneAppSizes.size_11 / ChallengeOneAppSizes.size_2),
          ChallengeOneAppSizes.size_250)
      ..relativeCubicTo(
          ChallengeOneAppSizes.size_50 - ChallengeOneAppSizes.size_15,
          -ChallengeOneAppSizes.size_175,
          ChallengeOneAppSizes.size_250,
          -ChallengeOneAppSizes.size_130,
          ChallengeOneAppSizes.size_250,
          -ChallengeOneAppSizes.size_0)
      ..close();
    return path1;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
