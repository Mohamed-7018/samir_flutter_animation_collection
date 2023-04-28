import 'package:flutter/material.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/core/utils/values.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/cubit/logout_cubit.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/view/common_view/slide_to_act.dart';

class LogoutPage extends StatelessWidget {
  final Object user;
  const LogoutPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              user.toString(),
            ),
            GlobalAppSizedBox.h_10,
            GlobalAppSizedBox.h_10,
            Builder(
              builder: (context) {
                final GlobalKey<SlideActionState> key = GlobalKey();
                return Padding(
                  padding: GlobalAppEdgeInsets.a_16,
                  child: SlideAction(
                    text: GlobalAppStrings.logout,
                    textStyle: GlobalAppStyles.googleFontsGenerator(context,
                            color: GlobalAppColors.kScaffoldLight)
                        .copyWith(fontSize: 16),
                    outerColor: GlobalAppColors.appBlue,
                    innerColor: GlobalAppColors.appPink,
                    sliderButtonIcon: const Icon(GlobalAppIcons.signOutIcon),
                    key: key,
                    onSubmit: () {
                      LogoutCubit.get(context).confirmSignOut(context);
                    },
                    borderRadius: GlobalAppSizes.s_16,
                    animationDuration:
                        Duration(seconds: GlobalAppSizes.s_1.toInt()),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
