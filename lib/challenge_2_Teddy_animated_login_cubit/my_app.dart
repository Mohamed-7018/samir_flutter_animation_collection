import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/cubit/dices_cubit.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/cubit/forget_pass_cubit.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/cubit/logout_cubit.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/cubit/registeration_type_dart_cubit.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/cubit/theme_cubit.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/view/screens/landing_page.dart';

import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';

class TeddyAnimatedLogin extends StatelessWidget {
  const TeddyAnimatedLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        BlocProvider<RegisterationTypeDartCubit>(
            create: (context) => RegisterationTypeDartCubit()),
        BlocProvider<LogoutCubit>(
          create: (context) => LogoutCubit(),
        ),
        BlocProvider<DicesCubit>(
          create: (context) => DicesCubit(),
        ),
        BlocProvider<ForgetPassCubit>(
          create: (context) => ForgetPassCubit(),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: lightTheme,
            debugShowCheckedModeBanner: false,
            darkTheme: darkTheme,
            themeMode: !ThemeCubit.get(context).theme
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const LandingPage(),
          );
        },
      ),
    );
  }
}
