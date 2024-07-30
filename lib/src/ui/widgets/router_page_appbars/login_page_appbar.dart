import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:flutter/material.dart';

class SettingsPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingsPageAppBar({super.key, this.leading, this.leadingWidth});
  final Widget? leading;
  final double? leadingWidth;

  @override
  Widget build(BuildContext context) {
    final lang = context.l10n;
    return AppBar(
      title: Text(lang.routingTestPage),
      leading: leading,
      leadingWidth: leadingWidth,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
