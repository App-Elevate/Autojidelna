import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_conf/assets.dart';
import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/logic/about_app_button_logic.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AboutAppButton extends StatelessWidget {
  const AboutAppButton({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.l10n;
    return IconButton(
      icon: const Icon(Icons.info_outline),
      onPressed: () => showAboutDialog(
        context: context,
        applicationName: lang.appName,
        applicationVersion:
            '${App.packageInfo.version} (${App.packageInfo.buildNumber})${kDebugMode ? lang.debug : ''}${App.currentPatchNumber != null ? ' - ${lang.patch} ${App.currentPatchNumber}' : ''}',
        applicationIcon: GestureDetector(
          onTap: appElevateClick,
          child: Image.asset(
            Assets.icon,
            width: 54,
          ),
        ),
        children: [
          Text(lang.appDescription),
          GestureDetector(
            onTap: appElevateClick,
            onLongPress: () async {
              context.router.push(const DebugPage());
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 27.01),
              child: Image.asset(Assets.appElevateLogo),
            ),
          ),
        ],
      ),
    );
  }
}
