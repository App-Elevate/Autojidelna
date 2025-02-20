import 'package:autojidelna/src/ui/theme/app_themes.dart';
import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({super.key, this.transparentDivider = false, this.text = '', this.textAlign, this.onPressed});
  final bool transparentDivider;
  final String text;
  final TextAlign? textAlign;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    if (text.trim().isEmpty) return CustomDivider(isTransparent: transparentDivider, hasIndent: false, hasEndIndent: false);
    if (onPressed == null) divider(context);

    return MaterialButton(
      visualDensity: const VisualDensity(vertical: -4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.zero,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      textColor: Theme.of(context).colorScheme.primary,
      onPressed: onPressed,
      child: divider(context),
    );
  }

  Row divider(BuildContext context) {
    return Row(
      children: [
        if (textAlign != TextAlign.start && textAlign != TextAlign.left && textAlign != TextAlign.justify)
          Flexible(child: CustomDivider(isTransparent: transparentDivider, hasIndent: false)),
        //
        if (text.trim().isNotEmpty && textAlign == TextAlign.end && onPressed != null) ...[
          Icon(Icons.arrow_forward_ios_rounded, size: 15, color: Theme.of(context).listTileTheme.subtitleTextStyle!.color),
          const SizedBox(width: 5),
        ],
        //
        Text(text, style: AppThemes.textTheme.labelLarge!.copyWith(color: Theme.of(context).dividerColor)),
        //
        if (textAlign != TextAlign.end && textAlign != TextAlign.right)
          Flexible(child: CustomDivider(isTransparent: transparentDivider, hasEndIndent: false)),
      ],
    );
  }
}
