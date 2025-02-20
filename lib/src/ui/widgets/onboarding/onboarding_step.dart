import 'package:flutter/material.dart';

abstract class OnboardingStep {
  Future<bool> onNextPage(BuildContext context);
  String description(BuildContext context);
  String buttonText(BuildContext context);
}

mixin OnboardingStepMixin on StatefulWidget {
  Future<bool> onNextPage(BuildContext context);
  String description(BuildContext context);
  String buttonText(BuildContext context);
}
