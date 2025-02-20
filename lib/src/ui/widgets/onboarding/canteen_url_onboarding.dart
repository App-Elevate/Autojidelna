import 'package:autojidelna/src/_global/providers/login.provider.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/widgets/divider_with_text.dart';
import 'package:autojidelna/src/ui/widgets/login/canteen_url_picker.dart';
import 'package:autojidelna/src/ui/widgets/login/custom_url_field.dart';
import 'package:autojidelna/src/ui/widgets/onboarding/onboarding_step.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CanteenUrlOnboarding extends StatelessWidget implements OnboardingStep {
  const CanteenUrlOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const CustomUrlField(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: DividerWithText(text: 'nebo'),
          ),
          ConstrainedBox(constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * .4), child: const CanteenUrlPicker()),
        ],
      ),
    );
  }

  @override
  Future<bool> onNextPage(BuildContext context) async {
    if (!context.read<LoginProvider>().urlForm.currentState!.validate()) return false;
    // TODO: Check if its an icanteen url
    return true;
  }

  @override
  String buttonText(BuildContext context) => context.l10n.next;

  @override
  String description(BuildContext context) => context.l10n.loginSubtitle;
}
