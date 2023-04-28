import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static ThemeCubit get(BuildContext context) => BlocProvider.of(context);
 ThemeCubit() : super(ThemeInitial()) {
    _loadPrefs();
  }
  // dark theme boolean variable
  bool darkTheme = false;

  // object from shared preferences class
  SharedPreferences? _prefs;
  bool get theme => darkTheme;

/*------------------------------------------------------------------------------------------*/
/*------------------------------------  current Theme  ---------------------------------------*/
/*------------------------------------------------------------------------------------------*/

  initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

/*------------------------------------------------------------------------------------------*/
/*------------------------------------  Switch Theme  ---------------------------------------*/
/*------------------------------------------------------------------------------------------*/
  switchTheme() {
    darkTheme = !darkTheme;
    _savePrefs();
    emit(ThemeSwithch());
  }

/*------------------------------------------------------------------------------------------*/
/*--------------------------------  Save new Theme  ---------------------------------------*/
/*------------------------------------------------------------------------------------------*/
  _savePrefs() async {
    await initPrefs();
    _prefs!.setBool('theme', darkTheme);
  }

/*------------------------------------------------------------------------------------------*/
/*------------------------------------  Load Theme  ---------------------------------------*/
/*------------------------------------------------------------------------------------------*/
  _loadPrefs() async {
    await initPrefs();
    darkTheme = _prefs!.getBool('theme') ?? false;
    emit(ThemeSharedPrefs());
  }
}
