import 'package:autojidelna/src/ui/theme/app_themes.dart';
import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.title, {super.key, this.moreInfo});
  final String title;
  final void Function()? moreInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomDivider(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppThemes.textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.primary)),
              if (moreInfo != null)
                GestureDetector(
                  onTap: () => moreInfo,
                  child: Icon(
                    Icons.info_outline_rounded,
                    size: AppThemes.textTheme.titleMedium!.fontSize! + 7,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
            ],
          ),
        ),
        const CustomDivider(height: 8, isTransparent: false),
        const CustomDivider(height: 4),
      ],
    );
  }
}
