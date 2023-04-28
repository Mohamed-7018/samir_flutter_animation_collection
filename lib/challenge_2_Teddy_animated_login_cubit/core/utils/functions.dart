// ignore_for_file: deprecated_member_use

part of values;

mixin GlobalAppFunctions {
    //-------------------------------------------------------------------/
  //----------------- submit alert dialog --------------------------/
  //-------------------------------------------------------------------/
  static Future<void> confirmCopyLink(BuildContext context,
      {String? link,
      required String title,
      required String content,
      required String defaultActionText,
      String? cancelActionText}) async {
    final dialogRequestSignOut = await showAlertDialogue(
      context,
      title: title,
      content: content,
      defaultActionText: defaultActionText,
      cancelActionText: cancelActionText,
    );
    if (dialogRequestSignOut == true && link != null) {
      launchUniversalLink(link);
    } else {}
  }

    //-------------------------------------------------------------------/
  //----------------- Launch URL Function --------------------------/
  //-------------------------------------------------------------------/
  static Future<void> launchUniversalLink(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }


static Future<void> showExceptionAlertDaialog(
    BuildContext context, {
    required String title,
    required Exception exception,
  }) =>
      showAlertDialogue(context,
          title: title, content: _message(exception), defaultActionText: "OK");

  static String _message(Exception exception) {
    if (exception is FirebaseAuthException) {
      return exception.message!;
    }
    return exception.toString();
  }

  static void showSignInError(BuildContext context, Exception exception) {
    if (exception is FirebaseAuthException &&
        exception.message == "Sign in aborted by user") {
      return;
    }
    showExceptionAlertDaialog(context,
        title: "Sign In Failed", exception: exception);
  }
}
