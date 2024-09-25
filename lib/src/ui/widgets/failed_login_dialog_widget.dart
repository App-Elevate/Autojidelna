//TODO: add this file to the project
/*
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/logic/canteenwrapper.dart';
import 'package:flutter/material.dart';
void failedLoginDialog(BuildContext context, String message) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      final lang = context.l10n;
      return PopScope(
        canPop: false,
        onPopInvoked: (hey) => false,
        child: AlertDialog(
          title: Text(lang.errorsLoginFailed),
          content: Text(lang.errorsLoginFailedDetail(message)),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          alignment: Alignment.bottomCenter,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoggingInWidget()), (route) => false);
              },
              child: Text(lang.tryAgain),
            ),
            TextButton(
              onPressed: () {
                loggedInCanteen.logout();
                Navigator.of(context).pop();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => (LoginScreen())), (route) => false);
              },
              child: Text(lang.logoutConfirm),
            ),
          ],
        ),
      );
    },
  );
}
*/
