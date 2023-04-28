import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/core/utils/values.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/provider/auth_provider.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/provider/validators.dart';

part 'login_cubit_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState>
    with EmailAndPasswordValidators {
  LoginCubitCubit() : super(LoginCubitInitial());

  static LoginCubitCubit get(BuildContext context) => BlocProvider.of(context);

  bool _isSubmitted = false;
  bool _isLoading = false;
  bool _isHidden = true;

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
/*-----------------------------------------------------------------------------------*/
/*------------------------  defining text editing controller -------------------------*/
/*-----------------------------------------------------------------------------------*/
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _passwordFieldController =
      TextEditingController();

  TextEditingController get emailFieldController => _emailFieldController;
  TextEditingController get passwordFieldController => _passwordFieldController;

  bool get isSubmitted => _isSubmitted;
  bool get isLoading => _isLoading;
  bool get isHidden => _isHidden;

  FocusNode get emailFocusNode => _emailFocusNode;
  FocusNode get passwordFocusNode => _passwordFocusNode;

  /// toogle is hodden
  void toggleIsHidden() {
    _isHidden = !_isHidden;
    emit(ToggleHiddenPassword());
  }

  // focus node --> next Step
  void emailEditingControl(BuildContext context) {
    final newFocus = _passwordFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

/*-----------------------------------------------------------------------------------*/
/*----------------  Passing Strings to complete sign in auth ----------------------*/
/*-----------------------------------------------------------------------------------*/
  void submit(
    BuildContext context,
    // TextEditingController emailFieldController,
    // TextEditingController passwordFielController,
  ) async {
    _isSubmitted = true;
    _isLoading = true;
    emit(ToggleLoadingState());

    try {
      final auth = Auth();
      await auth.signInWithEmailAndPassword(
        emailFieldController.text,
        passwordFieldController.text,
      );
      // Navigator.of(context).pop();
    } on Exception catch (e) {
      GlobalAppFunctions.showExceptionAlertDaialog(
        context,
        title: "Sign in failed",
        exception: e,
      );
    } finally {
      _isLoading = false;
      emit(ToggleLoadingState());
    }
  }

/*-----------------------------------------------------------------------------------*/
/*-------------------  Enabling/ disabling submitting mail --------------------------*/
/*-----------------------------------------------------------------------------------*/
  bool submitCheck(
      // TextEditingController emailFieldController,
      //   TextEditingController passwordFieldController
      ) {
    bool submitEnabled = emailValidator.isValid(emailFieldController.text) &&
        emailValidator.isCorrect(emailFieldController.text) &&
        passwordValidator.isValid(passwordFieldController.text) &&
        !_isLoading;

    return submitEnabled;
  }

  bool emailValid(TextEditingController emailFieldController,
      TextEditingController passwordFieldController) {
    return emailValidator.isValid(emailFieldController.text);
  }

  bool passwordValid(TextEditingController emailFieldController,
      TextEditingController passwordFieldController) {
    return passwordValidator.isValid(passwordFieldController.text);
  }

  bool emailCorrect(TextEditingController emailFieldController,
      TextEditingController passwordFieldController) {
    return passwordValidator.isCorrect(emailFieldController.text);
  }

/*-----------------------------------------------------------------------------------*/
/*-----------------  showing submitting error alert dialog --------------------------*/
/*-----------------------------------------------------------------------------------*/
  void submitErrorDialog(
      // TextEditingController emailFieldController,
      //   TextEditingController passwordFieldController,
      BuildContext context) {
    String? errorTitle;
    String? errorBody;

    if (emailValid(emailFieldController, passwordFieldController) == false &&
        passwordValid(emailFieldController, passwordFieldController) == false) {
      errorTitle = "Email/Pass are empty";
      errorBody = "The Email and password field Can't be empty";
    } else if (emailValid(emailFieldController, passwordFieldController) ==
            true &&
        passwordValid(emailFieldController, passwordFieldController) == false) {
      errorTitle = "Pass is empty";
      errorBody = "The password field can't be empty";
    } else if (emailValid(emailFieldController, passwordFieldController) ==
            false &&
        passwordValid(emailFieldController, passwordFieldController) == true) {
      errorTitle = "Email is empty";
      errorBody = "The Email field can't be empty";
    } else if (emailValid(emailFieldController, passwordFieldController) ==
            true &&
        passwordValid(emailFieldController, passwordFieldController) == true &&
        emailCorrect(emailFieldController, passwordFieldController) == false) {
      errorTitle = "Email is not valid";
      errorBody =
          "The Email is not valid, please enter a valid email.\nThe email must contain '@yahoo' or '@gmail' or'@hotmail' ";
    }

    GlobalAppFunctions.confirmCopyLink(context,
        title: errorTitle!, content: errorBody!, defaultActionText: "OK");
  }

/*-----------------------------------------------------------------------------------*/
/*-----------------  update state when entering a new letter -----------------------*/
/*-----------------------------------------------------------------------------------*/
  updateState() {
    emit(UpdateState());
  }

/* -------------------------------------------------------------*/
/* ------------------- Sign in with google --------------------*/
/* -------------------------------------------------------------*/
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      _isLoading = true;
      emit(ToggleLoadingState());

      final auth = Auth();
      await auth.signInWithGoogle();
    } on Exception catch (e) {
      GlobalAppFunctions.showSignInError(context, e);
    } finally {
      _isLoading = false;
      emit(ToggleLoadingState());
    }
  }

  /* -------------------------------------------------------------*/
/* ------------------- Sign in with facebook -------------------*/
/* -------------------------------------------------------------*/
  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      _isLoading = true;
      emit(ToggleLoadingState());

      final auth = Auth();
      await auth.signInWithFacebook();
    } on Exception catch (e) {
      GlobalAppFunctions.showSignInError(context, e);
    } finally {
      _isLoading = false;
      emit(ToggleLoadingState());
    }
  }
}
