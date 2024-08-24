import 'package:auto_route/auto_route.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:coree/src/_auth/login_logic.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(lang.deleteAccountDialog)),
      body: Center(
        child: ElevatedButton(
          onPressed: () async => handleAccountDeletion(),
          child: Text(lang.deleteAccountConfirm),
        ),
      ),
    );
  }
}
