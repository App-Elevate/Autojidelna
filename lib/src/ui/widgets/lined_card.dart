import 'package:autojidelna/src/ui/widgets/divider_with_text.dart';
import 'package:flutter/material.dart';

/// Creates a card with a horizontal bar at the top and bottom
class LinedCard extends StatelessWidget {
  const LinedCard({
    super.key,
    this.title,
    this.footer,
    this.titleTextAlign = TextAlign.start,
    this.footerTextAlign = TextAlign.center,
    this.smallButton = true,
    this.transparentTitleDivider = false,
    this.transparentFooterDivider = false,
    this.onPressed,
    this.child,
  });

  /// Card title, aligned with the top bar
  final String? title;

  /// Card title, aligned with the bottom bar
  final String? footer;

  /// How to align the title text
  final TextAlign titleTextAlign;

  /// How to align the footer text
  final TextAlign footerTextAlign;

  /// If true, the whole card will be pressable, else only the bottom bar
  final bool smallButton;

  /// If true, top bar will be transparent
  final bool transparentTitleDivider;

  /// If true, bottom bar will be transparent
  final bool transparentFooterDivider;

  /// The callback that is called when the button is tapped or otherwise activated.
  final void Function()? onPressed;

  /// Creates a widget that insets its child.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: smallButton ? null : onPressed,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DividerWithText(text: title ?? '', textAlign: titleTextAlign, transparentDivider: transparentTitleDivider),
              child ?? const SizedBox(),
              DividerWithText(text: footer ?? '', textAlign: footerTextAlign, transparentDivider: transparentFooterDivider, onPressed: onPressed),
            ],
          ),
        ),
      ),
    );
  }
}
