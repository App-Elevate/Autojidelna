import 'dart:async';

import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountStatusWidget extends StatefulWidget {
  const AccountStatusWidget({super.key});

  @override
  State<AccountStatusWidget> createState() => _AccountStatusWidgetState();
}

class _AccountStatusWidgetState extends State<AccountStatusWidget> {
  StreamSubscription<User?>? _authStateChanges;
  User? _user;

  @override
  void initState() {
    _authStateChanges ??= FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (mounted) {
        setState(() => _user = user);
      } else {
        unawaited(_authStateChanges?.cancel());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    unawaited(_authStateChanges?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      children: <Widget>[
        Text(l10n.accountStatus),
        Text(context.formatString(l10n.loggedIn, [_user != null ? 'true' : 'false'])),
        if (_user != null) Text(context.formatString(l10n.userId, [_user!.uid])),
        if (_user?.displayName != null) Text(context.formatString(l10n.userDisplayName, [_user!.displayName])),
        if (_user?.email != null) Text(context.formatString(l10n.userEmail, [_user!.email])),
        if (_user != null) Text(context.formatString(l10n.userEmailVerified, [_user!.emailVerified.toString()])),
        if (_user?.metadata.lastSignInTime != null) Text(context.formatString(l10n.lastSignInTime, [_user?.metadata.lastSignInTime.toString()])),
        if (_user?.metadata.creationTime != null) Text(context.formatString(l10n.accountcreationTime, [_user?.metadata.creationTime.toString()])),
        if (_user?.providerData != null)
          ..._user!.providerData.map(
            (UserInfo userInfo) => Text(context.formatString(l10n.providerId, [userInfo.providerId])),
          ),
      ],
    );
  }
}
