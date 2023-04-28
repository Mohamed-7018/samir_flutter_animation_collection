/*-------------------------------------  Home Logo  -------------------------------------*/

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/core/helper/responsive_helper.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/core/utils/values.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/view/widgets/registeration/blur_filter.dart';

class AnimatedLogo extends StatefulWidget {
  final String image;
  const AnimatedLogo({super.key, required this.image});

  @override
  DeviceLogoState createState() => DeviceLogoState();
}

class DeviceLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  AnimationController? _flipController;

  Animation? animation;
  Animation? flipAnimation;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: GlobalAppSizes.s_6000.toInt()));
    flipAnimation = Tween(begin: GlobalAppSizes.s_0, end: GlobalAppSizes.s_1)
        .animate(_flipController!);

    timer = Timer(Duration(milliseconds: GlobalAppSizes.s_500.toInt()),
        () => _flipController!.repeat());
  }

  @override
  void dispose() {
    _flipController!.dispose();
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: GlobalAppEdgeInsets.a_5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: GlobalAppColors.appPink, width: 5),
      ),
      child: AnimatedBuilder(
        animation: flipAnimation!,
        builder: (context, child) => Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(
                GlobalAppSizes.s_3.toInt(), GlobalAppSizes.s_2.toInt(), 0.001)
            ..rotateY(-GlobalAppSizes.s_2 * pi * (flipAnimation!.value)),
          child: BlurFilter(
            sigma: GlobalAppSizes.s_5,
            borderRadius: GlobalAppBorderRadius.r_150,
            child: CircleAvatar(
              backgroundColor: GlobalAppColors.kScaffoldLight.withOpacity(0.1),
              maxRadius: MyResponsiveHelper.isWeb()
                  ? MediaQuery.of(context).size.width * 0.05
                  : MediaQuery.of(context).size.width * GlobalAppSizes.s_014,
              child: Image.asset(
                widget.image,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
