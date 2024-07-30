import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:coree/src/ui/widgets/buttons/about_app_button_widget.dart';
import 'package:flutter/material.dart';

class DemoPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DemoPageAppBar({super.key, this.leading, this.leadingWidth});
  final Widget? leading;
  final double? leadingWidth;

  @override
  Widget build(BuildContext context) {
    final lang = context.l10n;
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      actions: const [AboutAppButton()],
      title: Text(lang.demoPageTitle),
      leading: leading,
      leadingWidth: leadingWidth,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
