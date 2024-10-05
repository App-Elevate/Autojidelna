import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_conf/notifications.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:autojidelna/src/ui/widgets/more/account_overview_card.dart';
import 'package:autojidelna/src/ui/widgets/more/location_picker_card.dart';
import 'package:autojidelna/src/ui/widgets/scroll_view_column.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Texts lang = context.l10n;
    final StackRouter router = context.router;

    return ScrollViewColumn(
      children: [
        const AccountOverviewCard(),
        const CustomDivider(),
        const LocationPickerCard(),
        const CustomDivider(height: 38),
        const CustomDivider(isTransparent: false),
        ListTile(
          leading: const Icon(Icons.person_outline),
          title: Text(lang.account),
          onTap: () async => router.push(const AccountPage()),
        ),
        /* TODO: make the page
        ListTile(
          leading: const Icon(Icons.analytics_outlined),
          title: Text(lang.statistics),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StatisticsScreen())),
        ),*/
        const CustomDivider(isTransparent: false),
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: Text(lang.settings),
          onTap: () async => router.push(const SettingsPage()),
        ),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: Text(lang.about),
          onTap: () async => router.push(const AboutPage()),
        ),
        ListTile(
          leading: const Icon(Icons.share_outlined),
          title: Text(lang.shareApp),
          onTap: () async => Share.share(Links.autojidelna, subject: lang.appName),
        ),
      ],
    );
  }
}
