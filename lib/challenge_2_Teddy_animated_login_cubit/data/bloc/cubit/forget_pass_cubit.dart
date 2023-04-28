import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/core/utils/values.dart';

part 'forget_pass_state.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  ForgetPassCubit() : super(ForgetPassInitial());
  static ForgetPassCubit get(BuildContext context) => BlocProvider.of(context);

  final TextEditingController _emailFieldController = TextEditingController();
  TextEditingController get emailFieldController => _emailFieldController;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

/*-----------------------------------------------------------------------------------*/
/*-----------------  update state when entering a new letter -----------------------*/
/*-----------------------------------------------------------------------------------*/
  updateState() {
    emit(UpdateState());
  }

/*---------------------------------------------------------------------------------------*/
/*-------------------------- Sending Forget Password Email  ------------------------------*/
/*---------------------------------------------------------------------------------------*/
  // final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  _showDialog(BuildContext context) {
    GlobalAppFunctions.confirmCopyLink(context,
        title: GlobalAppStrings.codeSent,
        content: GlobalAppStrings.codeSentMessage,
        defaultActionText: GlobalAppStrings.ok);
    _emailFieldController.clear();
  }

  void submitForm(BuildContext context) async {
    FocusScope.of(context).unfocus();
    if (true) {
      _isLoading = true;
      emit(ToggleLoadingState());
      try {
        await _auth
            .sendPasswordResetEmail(
                email: _emailFieldController.text.trim().toLowerCase())
            .then(
              (value) => _showDialog(context),
            );
      } catch (error) {
        GlobalAppFunctions.confirmCopyLink(context,
            title: "Error", content: error.toString(), defaultActionText: "OK");
      } finally {
        _isLoading = false;
        emit(ToggleLoadingState());
      }
    }
  }
}
