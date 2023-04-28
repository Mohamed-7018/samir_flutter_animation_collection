


abstract class StringValidators {
  bool isValid (String value);
  bool isCorrect (String value);
}



class CorrectNonEmptyStringValidator implements StringValidators {
/*-----------------------------------------------------------------------------------*/
/*---------------------------  checking non empty email  ----------------------------*/
/*-----------------------------------------------------------------------------------*/
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }


/*-----------------------------------------------------------------------------------*/
/*---------------------  checking existing email/not fake ---------------------------*/
/*-----------------------------------------------------------------------------------*/
  @override
  bool isCorrect (String value) {
    bool correctMail = (value.contains("@yahoo.com") ||
        value.contains("@gmail.com") ||
        value.contains("@hotmail.com"));
    bool validEmail = value.isNotEmpty && correctMail;

    return validEmail;
  }
}


mixin  EmailAndPasswordValidators {
  final StringValidators emailValidator = CorrectNonEmptyStringValidator();
  final StringValidators passwordValidator = CorrectNonEmptyStringValidator();
  final String invalidEmailErrorText = "Please Enter A valid Email";
  final String invalidPasswordErrorText = "Password can't be empty";
}
