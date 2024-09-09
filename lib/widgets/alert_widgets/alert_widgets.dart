import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

class AlertWidgets {
  Future<void> showOkCancelAlert(
      BuildContext context,
      int? cancelFuncOK,
      String messageText,
      String cancelLabelText,
      String titleText,
      String okLabelText,
      void okFunc) async {
    final result = await showOkCancelAlertDialog(
      context: context,
      title: titleText,
      message: messageText,
      okLabel: okLabelText,
      cancelLabel: cancelLabelText,
    );

    // Eğer bir işlem yapmak istiyorsanız, burada result'u kullanabilirsiniz.
    // örneğin:
    if (result == OkCancelResult.ok) {
      return okFunc;
    } else if (cancelFuncOK == 1) {
      return okFunc;
    }
  }

  Future<void> showOkAlert(BuildContext context, String messageText,
      String titleText, String okLabelText, void Function() okFunc) async {
    final result = await showOkAlertDialog(
      context: context,
      title: titleText,
      message: messageText,
      okLabel: okLabelText,
    );
    if (result == OkCancelResult.ok) {
      okFunc();
    }
  }
}
