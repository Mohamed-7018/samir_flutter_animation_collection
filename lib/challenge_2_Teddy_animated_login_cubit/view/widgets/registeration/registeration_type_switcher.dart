import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/core/utils/values.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/cubit/dices_cubit.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/cubit/registeration_type_dart_cubit.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/models/registeration_type.dart';

class RegisterationTypeSwitcher extends StatelessWidget {
  const RegisterationTypeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AnimatedDefaultTextStyle(
          curve: Curves.easeOutBack,
          style: TextStyle(),
          duration: Duration(milliseconds: 500),
          child: Text("Login"),
        ),
        BlocBuilder<RegisterationTypeDartCubit, RegisterationTypeDartState>(
          buildWhen: (previous, current) => current is ChangeRegisterationType,
          builder: (context, state) {
            return Switch(
              splashRadius: 50,
              value: RegisterationTypeDartCubit.get(context).type ==
                  RegistrationType.signup,
              onChanged: (value) {
                DicesCubit.get(context).changeDices();

                RegisterationTypeDartCubit.get(context)
                    .toggleRegisterationType();
              },
              activeTrackColor: GlobalAppColors.appBlue,
              inactiveTrackColor: GlobalAppColors.appBlue,
              inactiveThumbColor: GlobalAppColors.appPink,
              activeColor: GlobalAppColors.appPink,
            );
          },
        ),
        const AnimatedDefaultTextStyle(
          curve: Curves.easeOutBack,
          style: TextStyle(),
          duration: Duration(milliseconds: 500),
          child: Text("SigUp"),
        ),
      ],
    );
  }
}
