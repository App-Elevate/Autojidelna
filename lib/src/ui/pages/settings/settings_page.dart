import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_global/providers/is_online.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:coree/src/ui/widgets/account_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.l10n;
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () async => context.router.push(const RoutingParamPage()),
              child: Text(lang.routingGoToParamDetailPage),
            ),
            ElevatedButton(
              onPressed: () async => context.router.push(const LocalizationsPage()),
              child: Text(lang.language),
            ),
            ElevatedButton(
              onPressed: () async => context.router.push(LoginPage()),
              child: Text(lang.login),
            ),
            Consumer<IsOnline>(
              builder: (context, IsOnline isOnline, child) {
                return Text(
                  isOnline.isOnline ? lang.connectedToTheInternet : lang.disconnectedFromTheInternet,
                );
              },
            ),
            Consumer<IsOnline>(
              builder: (context, IsOnline isOnline, child) {
                return Text(
                  isOnline.isOnlineLocal ? lang.connectedToANetwork : lang.disconnectedFromANetwork,
                );
              },
            ),
            const AccountStatusWidget(),
          ],
        ),
      ),
    );
  }
}
