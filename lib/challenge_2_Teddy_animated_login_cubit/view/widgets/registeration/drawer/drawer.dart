//done
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/core/utils/values.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/cubit/dices_cubit.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/cubit/drawer_cubit.dart';

import 'drawer_clipper.dart';

class HomeDrawer extends StatelessWidget {
  final AnimationController? controller;

  const HomeDrawer({Key? key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Animation animation =
        Tween(begin: GlobalAppSizes.s_0, end: GlobalAppSizes.s_05).animate(
            CurvedAnimation(parent: controller!, curve: Curves.fastOutSlowIn));
    return Positioned(
      top: -(size.width * GlobalAppSizes.s_09),
      left: -(size.width * GlobalAppSizes.s_09),
      child: BlocBuilder<DrawerCubit, DrawerState>(
        builder: (context, state) {
          return BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: DrawerCubit.get(context).sigma,
              sigmaY: DrawerCubit.get(context).sigma,
            ),
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return ClipPath(
                  clipper: DrawerClipper(animation.value),
                  child: Stack(
                    children: [
                      Container(
                        // padding: GlobalAppEdgeInsets.l_30,
                        alignment: Alignment.centerRight,
                        width: size.width *
                            (GlobalAppSizes.s_18 / GlobalAppSizes.s_10),
                        height: size.width *
                            (GlobalAppSizes.s_18 / GlobalAppSizes.s_10),
                        color: GlobalAppColors.appPink.withOpacity(GlobalAppSizes
                            .s_06), //Colors.red.withOpacity(GlobalAppSizes.s_06),
                      ),
                      /*--------------------------------------------------------------------------------------*/
                      /*-------------------------------------  Exit Btn  -------------------------------------*/
                      /*--------------------------------------------------------------------------------------*/
                      Positioned(
                        top: size.width * GlobalAppSizes.s_09,
                        left: size.width * GlobalAppSizes.s_09,
                        child: SafeArea(
                          child: IconButton(
                            icon: const Icon(GlobalAppIcons.closeIcon),
                            color: GlobalAppColors.kScaffoldLight,
                            onPressed: () async {
                              await controller!.reverse();
                              // ignore: use_build_context_synchronously
                              DrawerCubit.get(context)
                                  .setBlurSigma(GlobalAppSizes.s_0);
                              // ignore: use_build_context_synchronously
                              DicesCubit.get(context).changeDices();
                            },
                          ),
                        ),
                      ),
                      /*--------------------------------------------------------------------------------------*/
                      /*-------------------------------------  Options  --------------------------------------*/
                      /*--------------------------------------------------------------------------------------*/
                      Positioned(
                        top: size.width *
                            ((GlobalAppSizes.s_100 + GlobalAppSizes.s_2) /
                                GlobalAppSizes.s_100),
                        left: size.width * GlobalAppSizes.s_09,
                        child: SafeArea(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              /*----------------------------------------------------------------------------*/
                              /*-------------------------------  AboutUs Btn  ------------------------------*/
                              /*----------------------------------------------------------------------------*/
                              // ignore: deprecated_member_use
                              TextButton(
                                onPressed: () {},
                                child: Container(
                                  width: GlobalAppSizes.s_160,
                                  height: GlobalAppSizes.s_50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: GlobalAppBorderRadius.r_10,
                                      color: GlobalAppColors.appBlue

                                      // color: const Color(0xFFF7BB0E)
                                      //     .withOpacity(GlobalAppSizes.s_07),
                                      ),
                                  child: const Text(
                                    GlobalAppStrings.aboutUs,
                                    style: GlobalAppStyles.whiteBoldStyle,
                                  ),
                                ),
                              ),
                              /*----------------------------------------------------------------------------*/
                              /*-------------------------------  Contact with TS Btn  -----------------------------*/
                              /*----------------------------------------------------------------------------*/
                              // ignore: deprecated_member_use
                              TextButton(
                                onPressed: () {},
                                child: Container(
                                  width: GlobalAppSizes.s_160,
                                  height: GlobalAppSizes.s_50,
                                  margin: GlobalAppEdgeInsets.sv_10,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: GlobalAppBorderRadius.r_10,
                                      color: GlobalAppColors.appBlue
                                      // color:  const Color(0xFFF7BB0E)
                                      //     .withOpacity(0.7),
                                      ),
                                  child: const Text(
                                    GlobalAppStrings.contactWithTS,
                                    style: GlobalAppStyles.whiteBoldStyle,
                                  ),
                                ),
                              ),
                              /*----------------------------------------------------------------------------*/
                              /*-------------------------------  Share Btn  ------------------------------*/
                              /*----------------------------------------------------------------------------*/
                              // ignore: deprecated_member_use
                              TextButton(
                                onPressed: () {},
                                child: Container(
                                  width: GlobalAppSizes.s_160,
                                  height: GlobalAppSizes.s_50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: GlobalAppBorderRadius.r_10,
                                      color: GlobalAppColors.appBlue

                                      // color:
                                      //     const Color(0xFFF7BB0E).withOpacity(0.7),
                                      ),
                                  child: const Text(
                                    GlobalAppStrings.shareApp,
                                    style: GlobalAppStyles.whiteBoldStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
