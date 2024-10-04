import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_conf/notifications.dart';
import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:autojidelna/src/ui/widgets/scroll_view_column.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Texts lang = context.l10n;

    String appVersion = lang.versionSubtitle(kDebugMode.toString(), App.packageInfo.version);

    Widget logo = SvgPicture.asset(
      Assets.logo,
      colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onSurface, BlendMode.srcIn),
      height: MediaQuery.sizeOf(context).height * .10,
    );

    return Scaffold(
      appBar: AppBar(title: Text(lang.about)),
      body: ScrollViewColumn(
        children: [
          // logo
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 85.0),
            child: SvgPicture.asset(
              Assets.logo,
              colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onSurface, BlendMode.srcIn),
              height: MediaQuery.sizeOf(context).height * .10,
            ),
          ),
          const CustomDivider(isTransparent: false),
          // version list tile
          ListTile(
            title: Text(lang.version),
            subtitle: Text(appVersion),
          ),
          // licenses list tile
          ListTile(
            title: Text(lang.licenses),
            onTap: () => unawaited(
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LicensePage(
                    applicationName: lang.appName,
                    applicationVersion: appVersion,
                    applicationIcon: logo,
                    applicationLegalese: lang.appLegalese(DateTime.now()),
                  ),
                ),
              ),
            ),
          ),
          // privacy policy
          ListTile(
            title: Text(lang.privacyPolicy),
            onTap: () => unawaited(launchUrl(Uri.parse(Links.privacyPolicy))),
          ),
          const CustomDivider(isTransparent: false),
          // links
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () => unawaited(launchUrl(Uri.parse(Links.autojidelna))),
                icon: const Icon(Icons.public_outlined),
              ),
              IconButton(
                onPressed: () => unawaited(launchUrl(Uri.parse(Links.repo))),
                icon: const Icon(Octicons.mark_github),
              ),
              IconButton(
                onPressed: () => unawaited(launchUrl(Uri(scheme: 'mailto', path: Links.email))),
                icon: const Icon(Icons.email_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
