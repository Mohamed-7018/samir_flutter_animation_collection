import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/core/utils/values.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/cubit/login_cubit_cubit.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/view/screens/registeration/forget_pass.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/view/widgets/registeration/bear_login_controller.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/view/widgets/registeration/text_tracker.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    BearLoginController bearLogInController = BearLoginController();

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: Column(
            children: [
              /*---------------------------------------------------------------------------------------*/
              /*------------------------------  Tracking teddy  ---------------------------------------*/
              /*---------------------------------------------------------------------------------------*/
              Container(
                height: GlobalAppSizes.s_200,
                padding: GlobalAppEdgeInsets.left30Right30,
                child: FlareActor(
                  GlobalAppFlares.teddyFlare,
                  shouldClip: false,
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.contain,
                  controller: bearLogInController,
                ),
              ),
              /*---------------------------------------------------------------------------------------*/
              /*------------------------------  Login Container  -------------------------------------*/
              /*---------------------------------------------------------------------------------------*/
              Container(
                decoration: BoxDecoration(
                  color: GlobalAppColors.appBlue.withOpacity(0.7),
                  borderRadius: const BorderRadius.all(
                    GlobalAppRadius.r_25,
                  ),
                ),
                child: Padding(
                  padding: GlobalAppEdgeInsets.a_5,
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GlobalAppSizedBox.h_10,
                        GlobalAppSizedBox.h_10,

                        /*---------------------------------------------------------------------------------------*/
                        /*---------------------------------------  Email  ---------------------------------------*/
                        /*---------------------------------------------------------------------------------------*/
                        BlocBuilder<LoginCubitCubit, LoginCubitState>(
                          buildWhen: (previous, current) {
                            if (current is UpdateState) {
                              return true;
                            } else {
                              return false;
                            }
                          },
                          builder: (context, state) {
                            return TrackingTextInput(
                              isObscured: false,
                              label: GlobalAppStrings.email,
                              hint: GlobalAppStrings.emailHint,
                              borderColor: Theme.of(context).primaryColor,
                              prefixIcon: GlobalAppIcons.emailOutlined,
                              prefixIconColor: Theme.of(context).primaryColor,
                              controller: LoginCubitCubit.get(context)
                                  .emailFieldController,
                              focusNode:
                                  LoginCubitCubit.get(context).emailFocusNode,
                              onEditingComplete: () =>
                                  LoginCubitCubit.get(context)
                                      .emailEditingControl(context),
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.emailAddress,
                              suggerstion: true,
                              suffixIcon: GestureDetector(
                                  onTap: () => LoginCubitCubit.get(context)
                                      .emailFieldController
                                      .clear(),
                                  child: const Icon(GlobalAppIcons.closeIcon)),
                              // label: GlobalAppStrings.email,
                              onCaretMoved: (Offset? caret) {
                                bearLogInController.coverEyes(caret == null);

                                bearLogInController.lookAt(caret);
                              },
                              changed: () =>
                                  LoginCubitCubit.get(context).updateState(),
                            );
                          },
                        ),
                        /*---------------------------------------------------------------------------------------*/
                        /*-------------------------------------  Password  --------------------------------------*/
                        /*---------------------------------------------------------------------------------------*/
                        BlocBuilder<LoginCubitCubit, LoginCubitState>(
                          buildWhen: (previous, current) {
                            if (current is UpdateState ||
                                current is ToggleHiddenPassword) {
                              return true;
                            } else {
                              return false;
                            }
                          },
                          builder: (context, state) {
                            return TrackingTextInput(
                              onEditingComplete: () {
                                bearLogInController.coverEyes(false);
                                bearLogInController.submitPassword();
                                LoginCubitCubit.get(context).submitCheck()
                                    ? LoginCubitCubit.get(context)
                                        .submit(context)
                                    : LoginCubitCubit.get(context)
                                        .submitErrorDialog(context);
                              },
                              controller: LoginCubitCubit.get(context)
                                  .passwordFieldController,
                              focusNode: LoginCubitCubit.get(context)
                                  .passwordFocusNode,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.text,
                              suggerstion: false,
                              label: GlobalAppStrings.password,
                              hint: GlobalAppStrings.passwordHint,
                              prefixIcon: GlobalAppIcons.lockOutlined,
                              borderColor: Theme.of(context).primaryColor,
                              prefixIconColor: Theme.of(context).primaryColor,
                              isObscured:
                                  LoginCubitCubit.get(context).isHidden == true,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  LoginCubitCubit.get(context).toggleIsHidden();
                                  if (LoginCubitCubit.get(context)
                                      .passwordFocusNode
                                      .hasFocus) {
                                    if (LoginCubitCubit.get(context).isHidden ==
                                        false) {
                                      bearLogInController.coverEyes(false);
                                    } else {
                                      bearLogInController.coverEyes(true);
                                    }
                                  }
                                },
                                child: LoginCubitCubit.get(context).isHidden
                                    ? Icon(
                                        GlobalAppIcons.unHidePass,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                      )
                                    : Icon(
                                        GlobalAppIcons.unHidePass,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                      ),
                              ),
                              onCaretMoved: (Offset? caret) {
                                if (LoginCubitCubit.get(context).isHidden ==
                                    false) {
                                  bearLogInController.coverEyes(false);
                                } else {
                                  bearLogInController.coverEyes(true);
                                }
                                bearLogInController.lookAt(caret);
                              },
                              onTextChanged: (String value) {
                                bearLogInController.setPassword(value);
                              },
                              changed: () =>
                                  LoginCubitCubit.get(context).updateState(),
                            );
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ForgetPassWord()),
                            );
                          },
                          child: const Padding(
                            padding: GlobalAppEdgeInsets.sv_10,
                            child: FractionallySizedBox(
                              widthFactor: GlobalAppSizes.s_1,
                              child: Text(
                                GlobalAppStrings.forgetPassword,
                                textAlign: TextAlign.right,
                                style:
                                    TextStyle(color: GlobalAppColors.appPink),
                              ),
                            ),
                          ),
                        ),
                        GlobalAppSizedBox.h_10,
                        GlobalAppSizedBox.h_10,
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: MediaQuery.of(context).size.width * 0.34,
          child: UnconstrainedBox(
            child: BlocBuilder<LoginCubitCubit, LoginCubitState>(
              buildWhen: (previous, current) {
                if (current is ToggleLoadingState) {
                  return true;
                } else {
                  return false;
                }
              },
              builder: (context, state) {
                return LoginCubitCubit.get(context).isLoading
                    ? const Row(
                        children: [
                          SpinKitCubeGrid(
                              color: GlobalAppColors.appPink,
                              size: GlobalAppSizes.s_40),
                          GlobalAppSizedBox.w_40,
                        ],
                      )
                    : TextButton(
                        onPressed: () {
                          bearLogInController.coverEyes(false);
                          bearLogInController.submitPassword();
                          LoginCubitCubit.get(context).submitCheck()
                              ? LoginCubitCubit.get(context).submit(context)
                              : LoginCubitCubit.get(context)
                                  .submitErrorDialog(context);
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: GlobalAppColors.kScaffoldLight,
                          shape: const StadiumBorder(),
                          textStyle: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                          backgroundColor: GlobalAppColors.appPink,
                          padding: GlobalAppEdgeInsets.sh_40v_14,
                        ),
                        child: const Text(GlobalAppStrings.login));
              },
            ),
          ),
        )
      ],
    );
  }
}
