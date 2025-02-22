import 'package:autojidelna/src/_global/providers/analytics.provider.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnalyticsSwitches extends StatelessWidget {
  const AnalyticsSwitches({super.key});

  @override
  Widget build(BuildContext context) {
    final Texts lang = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
      ],
    );
  }
}
