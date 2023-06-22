import 'package:flutter/material.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/view/widgets/registeration/dices.dart';

import '../../widgets/registeration/forms/forget_pass_form.dart';

class ForgetPassWord extends StatelessWidget {
  const ForgetPassWord({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          VariousDiscs(),
          SingleChildScrollView(child: ForgetPassForm()),
        ],
      )),
    );
  }
}
