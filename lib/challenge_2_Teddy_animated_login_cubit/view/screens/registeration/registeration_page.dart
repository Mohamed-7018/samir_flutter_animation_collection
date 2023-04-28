import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/core/utils/values.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/cubit/dices_cubit.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/cubit/drawer_cubit.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/cubit/login_cubit_cubit.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/cubit/registeration_type_dart_cubit.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/cubit/signup_cubit.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/view/widgets/registeration/animated_logo.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/view/widgets/registeration/buttons/social_btn.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/view/widgets/registeration/dices.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/view/widgets/registeration/drawer/drawer.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/view/widgets/registeration/forms/login_form.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/view/widgets/registeration/forms/signup_form.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/view/widgets/registeration/hint_circle.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/view/widgets/registeration/registeration_type_switcher.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/view/widgets/registeration/star/star_widget.dart';

class RegisterationPage extends StatefulWidget {
  const RegisterationPage({super.key});

  @override
  State<RegisterationPage> createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage>
    with SingleTickerProviderStateMixin {
  /* -------------------------------------------------------------*/
/* ------------------- Home Drawer Controller --------------------*/
/* -------------------------------------------------------------*/
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            // BlocProvider<DicesCubit>(
            //   create: (context) => DicesCubit(),
            //   child:
            const VariousDiscs(),
            // ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: GlobalAppBorderRadius.r_10,
                        ),
                        child: IconButton(
                          icon: const Icon(GlobalAppIcons.menuIcon,
                              color: GlobalAppColors.kScaffoldLight),
                          onPressed: () {
                            DicesCubit.get(context).changeDices();

                            DrawerCubit.get(context)
                                .setBlurSigma(GlobalAppSizes.s_8);

                            _controller!.forward();
                          },
                        ),
                      ),
                      const AnimatedLogo(image: GlobalAppImages.logo),
                      const StarWidget(
                        size: 50,
                      )
                    ],
                  ),
                  GlobalAppSizedBox.h_10,
                  GlobalAppSizedBox.h_10,
                  const RegisterationTypeSwitcher(),
                  FlipCard(
                    speed: 500,
                    key: RegisterationTypeDartCubit.get(context).cardKey,
                    direction: FlipDirection.VERTICAL,
                    flipOnTouch: false,
                    front: const LoginForm(),
                    back: const SignUpForm(),
                  ),
                  GlobalAppSizedBox.h_10,
                  BlocBuilder<SignupCubit, SignupState>(
                    builder: (context, state) {
                      return BlocBuilder<LoginCubitCubit, LoginCubitState>(
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  LoginCubitCubit.get(context).isLoading ||
                                          SignupCubit.get(context).isLoading
                                      ? null
                                      : LoginCubitCubit.get(context)
                                          .signInWithGoogle(context);
                                },
                                child: SocialBtn(
                                  icon: GlobalAppImages.googleICon,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  onClicked: () {},
                                  text: GlobalAppStrings.google,
                                ),
                              ),
                              const SizedBox(
                                height: GlobalAppSizes.s_50,
                                child: VerticalDivider(
                                  color: Colors.redAccent,
                                  endIndent: GlobalAppSizes.s_10,
                                  indent: GlobalAppSizes.s_10,
                                  width: GlobalAppSizes.s_10,
                                  thickness: GlobalAppSizes.s_2,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: SocialBtn(
                                  icon: GlobalAppImages.facebookIcon,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  onClicked: () {},
                                  text: GlobalAppStrings.facebook,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  GlobalAppSizedBox.h_10,
                  GlobalAppSizedBox.h_10,
                  const HintCircle(),
                  GlobalAppSizedBox.h_10,
                  GlobalAppSizedBox.h_10,
                ],
              ),
            ),
            HomeDrawer(
              controller: _controller,
            )
          ],
        ),
      ),
    );
  }
}
