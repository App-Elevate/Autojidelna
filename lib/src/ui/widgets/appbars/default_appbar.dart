import 'package:flutter/material.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppbar({super.key, this.leading, this.leadingWidth, this.title, this.actions});
  final Widget? leading;
  final double? leadingWidth;
  final Widget? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    actions?.add(const VerticalDivider(color: Colors.transparent));

    return AppBar(
      leading: leading,
      leadingWidth: leadingWidth,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
