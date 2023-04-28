import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/provider/auth_provider.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/view/common_view/show_alert_dialog.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());
  static LogoutCubit get(BuildContext context) => BlocProvider.of(context);

  /*-----------------------------------------------------------------------------------------------*/
  /*------------------------------ Sign out Function  -------------------------------*/
  /*-----------------------------------------------------------------------------------------------*/
  Future<void> signOut(BuildContext context) async {
    try {
      final auth = Auth();
      await auth.signOut();
      // if (kDebugMode) {
      //   print("Signed out");
      // }
    } catch (e) {
      // if (kDebugMode) {
      //   print(e.toString());
      // }
    }
  }

  /*-----------------------------------------------------------------------------------------------*/
  /*------------------------------ confirm sign out alert dialog  -------------------------------*/
  /*-----------------------------------------------------------------------------------------------*/
  Future<void> confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialogue(context,
        title: "Logout",
        content: "Are you sure you want to logout",
        defaultActionText: "Logout",
        cancelActionText: "Cancel");
    if (didRequestSignOut == true) {
      // ignore: use_build_context_synchronously
      signOut(context);
    } else {}
  }
}
