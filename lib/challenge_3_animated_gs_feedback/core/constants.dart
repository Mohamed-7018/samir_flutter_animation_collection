import 'package:flutter/material.dart';

import '../view/widgets/show_alert_dialog.dart';

class Constants {
  static final color2 = Colors.pink[800];

  static String rate='Poor';

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
    } else {}
  }

}