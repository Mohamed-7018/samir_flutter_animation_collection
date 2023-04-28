import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/core/helper/responsive_helper.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/core/utils/values.dart';

Future showAlertDialogue(
  BuildContext context, {
  required String title,
  required String content,
  String? cancelActionText = 'cancel',
  required String? defaultActionText,
}) {
  if (MyResponsiveHelper.isWeb()) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        elevation: GlobalAppSizes.s_5,
        shape: GlobalAppBorders.circular10,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              content,
              // style: GlobalAppTextStyles.alertDialogTitleStyle,
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    // ignore: avoid_dynamic_calls
                    Navigator.of(context).pop(true);
                  },
                  child: Padding(
                    padding: GlobalAppEdgeInsets.right20Top20,
                    child: Text(
                      defaultActionText!,
                      // style: GlobalAppTextStyles.alertDialogBodyStyle,
                    ),
                  ),
                ),
                cancelActionText == null
                    ? Container()
                    : GestureDetector(
                        onTap: () {
                          // ignore: avoid_dynamic_calls
                          Navigator.of(context).pop(false);
                        },
                        child: Padding(
                          padding: GlobalAppEdgeInsets.left20Top12,
                          child: Text(
                            cancelActionText,
                            // style: GlobalAppTextStyles.alertDialogBodyStyle,
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  } else if (!Platform.isIOS) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          if (cancelActionText != null)
            TextButton(
              child: Text(cancelActionText),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          TextButton(
            child: Text(defaultActionText!),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
  } else {
    return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          if (cancelActionText != null)
            CupertinoDialogAction(
              child: Text(cancelActionText),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          CupertinoDialogAction(
            child: Text(defaultActionText!),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
  }
}
