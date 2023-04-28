import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/core/utils/values.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/provider/auth_provider.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/data/bloc/provider/validators.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> with EmailAndPasswordValidators {
  SignupCubit() : super(SignupInitial());

  static SignupCubit get(BuildContext context) => BlocProvider.of(context);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get numberController => _numberController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

/*-----------------------------------------------------------------------------------*/
/*------------------------  Controlling focus node  ---------------------------------*/
/*-----------------------------------------------------------------------------------*/
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();

  FocusNode get emailFocusNode => _emailFocusNode;
  FocusNode get passwordFocusNode => _passwordFocusNode;
  FocusNode get confirmPasswordFocusNode => _confirmPasswordFocusNode;
  FocusNode get phoneNumberFocusNode => _phoneNumberFocusNode;

/*-----------------------------------------------------------------------------------*/
/*----------------  Passing Strings to complete sign in auth ----------------------*/
/*-----------------------------------------------------------------------------------*/
  bool _submitted = false;
  bool _isLoading = false;
  bool _isHidden = true;

  bool get isSubmitted => _submitted;
  bool get isLoading => _isLoading;
  bool get isHidden => _isHidden;

  void emailEditingControl(BuildContext context) {
    final newFocus = _passwordFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void passwordEditingControl(BuildContext context) {
    final newFocus = _confirmPasswordFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void confirmPasswordEditingControl(BuildContext context) {
    final newFocus = _phoneNumberFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  /// toogle is hodden
  void toggleIsHidden() {
    _isHidden = !_isHidden;
    emit(ToggleHiddenPassword());
  }

/*-----------------------------------------------------------------------------------*/
/*-----------------  update state when entering a new letter -----------------------*/
/*-----------------------------------------------------------------------------------*/
  updateState() {
    emit(UpdateState());
  }

  void submit(
    BuildContext context,
    // TextEditingController emailFieldController,
    // TextEditingController passwordFielController,
  ) async {
    _submitted = true;
    _isLoading = true;
    emit(ToggleLoadingState());
    try {
      final auth = Auth();
      await auth.createUserWithEmailAndPassword(
          emailController.text, passwordController.text);
      //Navigator.of(context).pop();
      // Navigator.of(context).pop();
    } on Exception catch (e) {
      GlobalAppFunctions.showExceptionAlertDaialog(
        context,
        title: "Sign up failed",
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
      // TextEditingController passwordFieldController,
      // TextEditingController phoneFieldController,
      // TextEditingController confirmPassswordFieldController,
      ) {
    bool submitEnabled = emailValidator.isValid(emailController.text) &&
        emailValidator.isCorrect(emailController.text) &&
        passwordValidator.isValid(passwordController.text) &&
        typicalPassword(passwordController, confirmPasswordController) &&
        !_isLoading;

    return submitEnabled;
  }

  bool typicalPassword(
      TextEditingController password, TextEditingController confirmPassword) {
    return password.text == confirmPassword.text && password.text.isNotEmpty;
  }

  bool emailValid(TextEditingController email) {
    return emailValidator.isValid(email.text);
  }

  bool passwordValid(TextEditingController passeord) {
    return passwordValidator.isValid(passeord.text);
  }

  bool emailCorrect(TextEditingController email) {
    return emailValidator.isCorrect(email.text);
  }

  /*-----------------------------------------------------------------------------------*/
/*-----------------  showing submitting error alert dialog --------------------------*/
/*-----------------------------------------------------------------------------------*/
  void submitErrorDialog(
    // TextEditingController emailFieldController,
    // TextEditingController passwordFieldController,
    // TextEditingController phoneFieldController,
    // TextEditingController confirmPassswordFieldController,
    BuildContext context,
  ) {
    String? errorTitle;
    String? errorBody;

    if (emailValid(emailController) == false &&
        passwordValid(passwordController) == false) {
      errorTitle = "Email/Pass are empty";
      errorBody = "The Email and password field Can't be empty";
    } else if (emailValid(emailController) == true &&
        passwordValid(passwordController) == false) {
      errorTitle = "Pass is empty";
      errorBody = "The password field can't be empty";
    } else if (emailValid(emailController) == false &&
        passwordValid(passwordController) == true) {
      errorTitle = "Email is empty";
      errorBody = "The Email field can't be empty";
    } else if (emailValid(emailController) == true &&
        passwordValid(passwordController) == true &&
        emailCorrect(emailController) == false) {
      errorTitle = "Email is not valid";
      errorBody =
          "The Email is not valid, please enter a valid email.\nThe email must contain '@yahoo' or '@gmail' or'@hotmail' ";
    } else if (emailValid(emailController) == true &&
        passwordValid(passwordController) == true &&
        emailCorrect(emailController) == true &&
        typicalPassword(passwordController, confirmPasswordController) ==
            false) {
      errorTitle = "Different password";
      errorBody =
          "You entered different password, please enter typical passwords";
    }

    GlobalAppFunctions.confirmCopyLink(context,
        title: errorTitle!, content: errorBody!, defaultActionText: "OK");
  }
}
