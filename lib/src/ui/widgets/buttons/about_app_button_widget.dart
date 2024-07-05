import 'package:coree/src/_conf/Assets.dart';
import 'package:coree/src/_global/package_info.dart';
import 'package:coree/src/logic/about_app_button_logic.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AboutAppButton extends StatelessWidget {
  const AboutAppButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.info_outline),
      onPressed: () => showAboutDialog(
        context: context,
        applicationName: 'APPE Core',
        applicationVersion: App.packageInfo.version + (kDebugMode ? ' - debug' : ''),
        applicationIcon: GestureDetector(
          onTap: appElevateClick,
          child: Image.asset(
            Assets.icon,
            width: 54,
          ),
        ),
        children: [
          const Text('Aplikace, která je základ pro další aplikace'),
          GestureDetector(
            onTap: appElevateClick,
            child: Padding(
              padding: const EdgeInsets.only(top: 27.0),
              child: Image.asset(Assets.appElevateLogo),
            ),
          ),
        ],
      ),
    );
  }
}
