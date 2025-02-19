import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:autojidelna/src/ui/widgets/theme_mode_picker.dart';
import 'package:autojidelna/src/ui/widgets/theme_style_picker.dart';
import 'package:flutter/material.dart';

class ThemeOnboarding extends StatelessWidget {
  const ThemeOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: ThemeModePicker(),
        ),
        CustomDivider(height: 26),
        ThemeStylePicker(),
        CustomDivider(height: 32),
      ],
    );
  }
}
