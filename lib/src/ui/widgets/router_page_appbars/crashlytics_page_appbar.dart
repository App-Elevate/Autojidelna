import 'package:flutter/material.dart';

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
