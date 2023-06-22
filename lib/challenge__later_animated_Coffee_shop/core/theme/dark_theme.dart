import 'package:flutter/material.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/core/utils/values.dart';
import 'common_theme.dart';

/*------------------------------------------------------------------------------------------*/
/*------------------------------------  Dark Theme  ---------------------------------------*/
/*------------------------------------------------------------------------------------------*/

ThemeData darkTheme = ThemeData.dark().copyWith(
  useMaterial3: true,
  primaryColor: commonTheme.primaryColor,
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(secondary: commonTheme.colorScheme.secondary),
  visualDensity: commonTheme.visualDensity,
  dividerColor: commonTheme.dividerColor,
  scaffoldBackgroundColor: GlobalAppColors.kScaffoldDark,
);
