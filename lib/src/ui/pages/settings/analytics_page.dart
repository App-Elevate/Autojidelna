import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_conf/notifications.dart';
import 'package:autojidelna/src/_global/providers/settings.provider.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/theme/app_themes.dart';
import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:autojidelna/src/ui/widgets/scroll_view_column.dart';
import 'package:autojidelna/src/ui/widgets/section_title.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Texts lang = context.l10n;
    TextStyle style = AppThemes.textTheme.bodySmall!.copyWith(color: Colors.blue, decoration: TextDecoration.underline);

    return Scaffold(
      appBar: AppBar(title: Text(lang.analytics)),
      body: ScrollViewColumn(
        children: [
          SectionTitle(lang.analytics),
          Selector<Settings, ({bool read, void Function(bool) set})>(
            selector: (_, p1) => (read: p1.disableAnalytics, set: p1.setAnalytics),
            builder: (_, analytics, ___) {
              return SwitchListTile(
                title: Text(lang.stopAnalytics),
                value: analytics.read,
                onChanged: analytics.set,
              );
            },
          ),
          const CustomDivider(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: RichText(
              text: TextSpan(
                text: lang.analyticsDescription_1,
                style: AppThemes.textTheme.bodySmall!.copyWith(color: Theme.of(context).dividerColor),
                children: [
                  TextSpan(
                    text: lang.analyticsDescription_2,
                    style: style,
                    recognizer: TapGestureRecognizer()..onTap = () => openDataCollectionUrl(true),
                  ),
                  TextSpan(text: lang.analyticsDescription_3),
                  TextSpan(
                    text: lang.analyticsDescription_4,
                    style: style,
                    recognizer: TapGestureRecognizer()..onTap = () => openDataCollectionUrl(false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void openDataCollectionUrl(bool sourceCode) {
    String url = sourceCode ? Links.currentVersionCode : Links.privacyPolicy;
    unawaited(launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication));
  }
}
