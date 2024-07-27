import 'package:auto_route/auto_route.dart';
import 'package:coree/src/crash_testing/crash.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CrashliticsPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CrashliticsPageAppBar({super.key, this.leading, this.leadingWidth});
  final Widget? leading;
  final double? leadingWidth;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      leadingWidth: leadingWidth,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

@RoutePage()
class CrashlyticsPage extends StatelessWidget {
  const CrashlyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.l10n;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(lang.crashlyticsPage),
          TextButton(onPressed: crashlyticsTestFunction, child: Text(lang.crashlyticsTestCrash)),
          TextButton(
            onPressed: () async {
              if (await Permission.location.request() == PermissionStatus.granted) {
                debugPrint('Permission granted');
              } else {
                debugPrint('Permission denied');
              }
            },
            child: const Text('Get Location test'),
          ),
        ],
      ),
    );
  }
}
