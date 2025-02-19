import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:flutter/material.dart';

class PermissionsOnboarding extends StatelessWidget {
  const PermissionsOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text('Udelit oznameni'),
          subtitle: Text('povolit bla bla bla'),
          trailing: OutlinedButton(onPressed: null, child: Icon(Icons.check)), // TODO
        ),
        CustomDivider(isTransparent: false),
        SwitchListTile(title: Text('Posilat crash logy'), subtitle: Text('crash log'), value: true, onChanged: null),
        SwitchListTile(title: Text('Posilat data'), subtitle: Text('data'), value: true, onChanged: null),
      ],
    );
  }
}
