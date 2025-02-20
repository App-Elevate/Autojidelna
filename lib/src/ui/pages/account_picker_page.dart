import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_global/providers/login.provider.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/theme/app_themes.dart';
import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:autojidelna/src/ui/widgets/onboarding/account_picker_onboarding.dart';
import 'package:autojidelna/src/types/onboarding_step.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AccountPickerPage extends StatelessWidget implements AutoRouteWrapper {
  const AccountPickerPage({super.key, this.onCompletedCallback});
  final void Function(bool onSuccess)? onCompletedCallback;

  final OnboardingStep page = const AccountPickerOnboarding();

  void _nextPage(BuildContext context) async {
    if (!await page.onNextPage(context)) return;
    if (onCompletedCallback == null) {
      if (context.mounted) context.router.replaceAll([const RouterPage()], updateExistingRoutes: false);
      return;
    }
    onCompletedCallback!(true);
  }

  void _previousPage(BuildContext context) async {
    context.router.maybePop();
  }

  @override
  Widget build(BuildContext context) {
    final Texts lang = context.l10n;
    return PopScope(
      canPop: context.router.canNavigateBack,
      child: Scaffold(
        appBar: AppBar(forceMaterialTransparency: true, automaticallyImplyLeading: false),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.rocket_launch_outlined, size: 55, color: Theme.of(context).colorScheme.surface),
              ),
              ListTile(
                title: Text(lang.appName, style: AppThemes.textTheme.displaySmall),
                subtitle: Text(page.description(context), style: AppThemes.textTheme.titleMedium),
              ),
              const CustomDivider(height: 32),
              Card(child: page as Widget),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Consumer<LoginProvider>(
            builder: (context, provider, ___) {
              ThemeData theme = Theme.of(context);
              return Row(
                children: [
                  if (context.router.canNavigateBack)
                    FilledButton(
                      style: theme.filledButtonTheme.style!.copyWith(backgroundColor: WidgetStatePropertyAll(theme.disabledColor)),
                      onPressed: provider.loggingIn ? null : () => _previousPage(context),
                      child: const Icon(Icons.arrow_back_outlined),
                    ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FilledButton(
                      onPressed: provider.loggingIn || provider.pickedAccount == null ? null : () => _nextPage(context),
                      child: Text(page.buttonText(context)),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => ChangeNotifierProvider(create: (_) => LoginProvider(), child: this);
}
