import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/core/utils/values.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/cubit/forget_pass_cubit.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/view/widgets/registeration/bear_login_controller.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/view/widgets/registeration/text_tracker.dart';

class ForgetPassForm extends StatelessWidget {
  const ForgetPassForm({super.key});

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
                        BlocBuilder<ForgetPassCubit, ForgetPassState>(
                          builder: (context, state) {
                            return TrackingTextInput(
                              isObscured: false,
                              label: GlobalAppStrings.email,
                              hint: GlobalAppStrings.emailHint,
                              borderColor: Theme.of(context).primaryColor,
                              prefixIcon: GlobalAppIcons.emailOutlined,
                              prefixIconColor: Theme.of(context).primaryColor,
                              controller: ForgetPassCubit.get(context)
                                  .emailFieldController,
                              focusNode: FocusNode(),
                              onEditingComplete: () {
                                ForgetPassCubit.get(context)
                                    .submitForm(context);
                              },
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.emailAddress,
                              suggerstion: true,
                              suffixIcon: GestureDetector(
                                  onTap: () => ForgetPassCubit.get(context)
                                      .emailFieldController
                                      .clear(),
                                  child: const Icon(GlobalAppIcons.closeIcon)),
                              // label: GlobalAppStrings.email,
                              onCaretMoved: (Offset? caret) {
                                bearLogInController.coverEyes(false);

                                bearLogInController.lookAt(caret);
                              },
                              changed: () =>
                                  ForgetPassCubit.get(context).updateState(),
                            );
                          },
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
          right: MediaQuery.of(context).size.width * 0.3,
          child: UnconstrainedBox(
            child: BlocBuilder<ForgetPassCubit, ForgetPassState>(
              builder: (context, state) {
                return ForgetPassCubit.get(context).isLoading
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
                          ForgetPassCubit.get(context).submitForm(context);
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
                        child: const Text(GlobalAppStrings.sendCode));
              },
            ),
          ),
        )
      ],
    );
  }
}
