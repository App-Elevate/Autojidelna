import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:autojidelna/src/ui/widgets/scroll_view_column.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Texts lang = context.l10n;
    final StackRouter router = context.router;

    return Scaffold(
      appBar: AppBar(title: Text(lang.settings)),
      body: ScrollViewColumn(
        children: [
          const CustomDivider(height: 4),
          ListTile(
            leading: const Icon(Icons.palette_outlined),
            title: Text(lang.appearance),
            onTap: () async => router.push(const AppearancePage()),
          ),
          ListTile(
            leading: const Icon(Icons.tune_outlined),
            title: Text(lang.convenience),
            onTap: () async => router.push(const ConveniencePage()),
          ),
          ListTile(
            leading: const Icon(Icons.edit_notifications_outlined),
            title: Text(lang.notifications),
            onTap: () async => AwesomeNotifications().showNotificationConfigPage(),
          ),
          ListTile(
            leading: const Icon(Icons.cookie_outlined),
            title: Text(lang.analytics),
            onTap: () async => router.push(const AnalyticsPage()),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(lang.about),
            onTap: () async => router.push(const AboutPage()),
          ),
        ],
      ),
    );
  }
}
