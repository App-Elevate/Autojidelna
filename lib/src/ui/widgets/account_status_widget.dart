import 'dart:async';

import 'package:coree/src/lang/lang.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

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
    return Column(
      children: <Widget>[
        Text(Alocale.accountStatus.getString(context)),
        Text(context.formatString(Alocale.loggedIn, [_user != null ? 'true' : 'false'])),
        if (_user != null) Text(context.formatString(Alocale.userId, [_user!.uid])),
        if (_user?.displayName != null) Text(context.formatString(Alocale.userDisplayName, [_user!.displayName])),
        if (_user?.email != null) Text(context.formatString(Alocale.userEmail, [_user!.email])),
        if (_user != null) Text(context.formatString(Alocale.userEmailVerified, [_user!.emailVerified.toString()])),
        if (_user?.metadata.lastSignInTime != null) Text(context.formatString(Alocale.lastSignInTime, [_user?.metadata.lastSignInTime.toString()])),
        if (_user?.metadata.creationTime != null) Text(context.formatString(Alocale.accountcreationTime, [_user?.metadata.creationTime.toString()])),
        if (_user?.providerData != null)
          ..._user!.providerData.map(
            (UserInfo userInfo) => Text(context.formatString(Alocale.providerId, [userInfo.providerId])),
          ),
      ],
    );
  }
}
