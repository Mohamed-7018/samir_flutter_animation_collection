import 'package:flutter/material.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/core/utils/values.dart';

import 'common_theme.dart';

/*------------------------------------------------------------------------------------------*/
/*------------------------------------  Light Theme  ---------------------------------------*/
/*------------------------------------------------------------------------------------------*/

ThemeData lightTheme = ThemeData.light().copyWith(
  useMaterial3: true,
  primaryColor: commonTheme.primaryColor,
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(secondary: commonTheme.colorScheme.secondary),
  scaffoldBackgroundColor: GlobalAppColors.kScaffoldLight,
  dividerColor: commonTheme.dividerColor,
  visualDensity: commonTheme.visualDensity,
);
