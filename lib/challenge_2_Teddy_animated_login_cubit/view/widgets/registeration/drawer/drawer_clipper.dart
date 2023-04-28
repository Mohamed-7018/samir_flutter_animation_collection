//done
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/core/utils/values.dart';

/*---------------------------------------   Drawer Clipper  ---------------------------------------*/

class DrawerClipper extends CustomClipper<Path> {
  final double radius;

  DrawerClipper(this.radius);

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.arcTo(
        Rect.fromCenter(
            center: Offset(size.width / GlobalAppSizes.s_2,
                size.height / GlobalAppSizes.s_2),
            width: size.width,
            height: size.height),
        GlobalAppSizes.s_0,
        pi * radius,
        false);

    path.lineTo(
        size.width / GlobalAppSizes.s_2, size.height / GlobalAppSizes.s_2);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
