import 'package:flutter/material.dart';

class MoreAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MoreAppBar({super.key});

  @override
  Widget build(BuildContext context) => AppBar(automaticallyImplyLeading: false, forceMaterialTransparency: true);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
