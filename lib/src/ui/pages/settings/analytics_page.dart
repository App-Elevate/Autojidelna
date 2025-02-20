import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_global/providers/analytics.provider.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:autojidelna/src/ui/widgets/dialogs/configured_alert_dialog.dart';
import 'package:autojidelna/src/ui/widgets/dialogs/configured_dialog.dart';
import 'package:autojidelna/src/ui/widgets/scroll_view_column.dart';
import 'package:autojidelna/src/ui/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Texts lang = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(lang.analytics)),
      body: ScrollViewColumn(
        children: [
          SectionTitle(lang.analytics, moreInfo: () => moreInfo(context, lang)),
          Selector<AnalyticsProvider, ({bool read, void Function(bool) set})>(
            selector: (_, p1) => (read: p1.allowAnalytics, set: p1.setAllowAnalytics),
            builder: (_, analytics, ___) {
              return SwitchListTile(
                dense: false,
                title: Text(lang.allowAnalytics),
                subtitle: Text(lang.allowAnalyticsSubtitle),
                value: analytics.read,
                onChanged: analytics.set,
              );
            },
          ),
          const CustomDivider(height: 8),
          Selector<AnalyticsProvider, ({bool read, void Function(bool) set})>(
            selector: (_, p1) => (read: p1.sendCrashLogs, set: p1.setSendCrashLogs),
            builder: (_, analytics, ___) {
              return SwitchListTile(
                dense: false,
                title: Text(lang.sendCrashLogs),
                subtitle: Text(lang.sendCrashLogsSubtitle),
                value: analytics.read,
                onChanged: analytics.set,
              );
            },
          ),
          const CustomDivider(height: 8),
        ],
      ),
    );
  }

  void moreInfo(BuildContext context, Texts lang) => configuredDialog(
        context,
        builder: (context) => ConfiguredAlertDialog(
          title: lang.moreInfo,
          content: Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Text(lang.analyticsMoreInfo)),
          customCancelText: lang.ok,
        ),
      );
}
