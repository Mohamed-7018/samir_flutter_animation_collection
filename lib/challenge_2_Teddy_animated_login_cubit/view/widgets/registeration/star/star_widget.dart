import 'dart:math';

import 'package:flutter/material.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/core/utils/values.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/view/widgets/registeration/star/star_clipper.dart';

class StarWidget extends StatelessWidget {
  final double size;

  const StarWidget({super.key, required this.size});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.rotate(
          angle: -(pi * GlobalAppSizes.s_35) / GlobalAppSizes.s_360,
          child: ClipPath(
            clipper: StarClipper(GlobalAppSizes.s_5.toInt()),
            child: Container(
              width: size,
              height: size,
              color: Colors.amber,
              alignment: Alignment.center,
            ),
          ),
        ),
        Text(
          '5',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w900,
          ),
          softWrap: true,
        ),
      ],
    );
  }
}
