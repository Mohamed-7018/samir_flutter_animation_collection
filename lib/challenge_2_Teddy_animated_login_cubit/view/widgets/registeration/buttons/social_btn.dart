import 'package:flutter/material.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/core/utils/values.dart';

class SocialBtn extends StatelessWidget {
  final String icon;
  final Color color;
  final Function onClicked;
  final String text;
  const SocialBtn({
    super.key,
    required this.icon,
    required this.color,
    required this.onClicked,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * GlobalAppSizes.s_04,
      height: GlobalAppSizes.s_50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: GlobalAppBorderRadius.r_60,
      ),
      child: Stack(
        children: [
          Padding(
            padding: GlobalAppEdgeInsets.left2Top3Bottom3,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: const BoxDecoration(
                  color: GlobalAppColors.kScaffoldLight,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(icon),
              ),
            ),
          ),
          Padding(
            padding: GlobalAppEdgeInsets.right25,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                text,
                style: GlobalAppStyles.googleFontsGenerator(context,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
