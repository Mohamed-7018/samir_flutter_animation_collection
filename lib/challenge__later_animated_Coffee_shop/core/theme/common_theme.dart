import 'package:flutter/material.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/core/utils/values.dart';

/*------------------------------------------------------------------------------------------*/
/*------------------------------------  Common Theme  ---------------------------------------*/
/*------------------------------------------------------------------------------------------*/

var commonTheme = ThemeData(
  primaryColor: GlobalAppColors.appBlue,
  dividerColor: GlobalAppColors.appPink,
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: GlobalAppColors.appPink),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
