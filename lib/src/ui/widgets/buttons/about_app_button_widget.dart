import 'package:coree/src/_conf/assets.dart';
import 'package:coree/src/_global/app.dart';
import 'package:coree/src/lang/lang.dart';
import 'package:coree/src/logic/about_app_button_logic.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class AboutAppButton extends StatelessWidget {
  const AboutAppButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.info_outline),
      onPressed: () => showAboutDialog(
        context: context,
        applicationName: Alocale.appName.getString(context),
        applicationVersion: App.packageInfo.version + (kDebugMode ? Alocale.debug.getString(context) : ''),
        applicationIcon: GestureDetector(
          onTap: appElevateClick,
          child: Image.asset(
            Assets.icon,
            width: 54,
          ),
        ),
        children: [
          Text(Alocale.appDescription.getString(context)),
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
