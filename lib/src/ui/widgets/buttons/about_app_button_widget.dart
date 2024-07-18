import 'package:coree/src/_conf/assets.dart';
import 'package:coree/src/_global/app.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:coree/src/logic/about_app_button_logic.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AboutAppButton extends StatelessWidget {
  const AboutAppButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return IconButton(
      icon: const Icon(Icons.info_outline),
      onPressed: () => showAboutDialog(
        context: context,
        applicationName: l10n.appName,
        applicationVersion: App.packageInfo.version + (kDebugMode ? l10n.debug : ''),
        applicationIcon: GestureDetector(
          onTap: appElevateClick,
          child: Image.asset(
            Assets.icon,
            width: 54,
          ),
        ),
        children: [
          Text(l10n.appDescription),
          GestureDetector(
            onTap: appElevateClick,
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
