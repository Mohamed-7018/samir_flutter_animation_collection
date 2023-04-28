import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/core/utils/values.dart';

class ColorLoader extends StatelessWidget {
  const ColorLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitCubeGrid(
        color: GlobalAppColors.appPink, size: GlobalAppSizes.s_40);
  }
}
