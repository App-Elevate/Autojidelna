import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/widgets/buttons/analytics_switches.dart';
import 'package:autojidelna/src/ui/widgets/dialogs/configured_alert_dialog.dart';
import 'package:autojidelna/src/ui/widgets/dialogs/configured_dialog.dart';
import 'package:autojidelna/src/ui/widgets/scroll_view_column.dart';
import 'package:autojidelna/src/ui/widgets/section_title.dart';
import 'package:flutter/material.dart';

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
          const AnalyticsSwitches(),
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
