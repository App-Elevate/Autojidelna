import 'package:flutter/material.dart';

class MenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MenuAppBar({super.key});

  @override
  Widget build(BuildContext context) => AppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
