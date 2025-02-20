import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_global/providers/login.provider.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/theme/app_themes.dart';
import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:autojidelna/src/ui/widgets/onboarding/canteen_url_onboarding.dart';
import 'package:autojidelna/src/ui/widgets/onboarding/login_onboarding.dart';
import 'package:autojidelna/src/ui/widgets/onboarding/onboarding_step.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  const LoginPage({super.key, this.onCompletedCallback});
  final void Function(bool onSuccess)? onCompletedCallback;

  @override
  State<LoginPage> createState() => _LoginPageState();

  @override
  Widget wrappedRoute(BuildContext context) => ChangeNotifierProvider(create: (_) => LoginProvider(), child: this);
}

class _LoginPageState extends State<LoginPage> {
  late final PageController _pageController;
  int _currentPage = 0;

  final List<OnboardingStep> pages = [
    const CanteenUrlOnboarding(),
    const LoginOnboarding(),
  ];

  void _nextPage() async {
    if (!await pages[_currentPage].onNextPage(context)) return;
    if (_currentPage >= pages.length - 1) {
      if (!mounted) return;
      if (widget.onCompletedCallback == null) {
        context.router.replaceAll([const RouterPage()]);
        return;
      }
      widget.onCompletedCallback!(true);
      return;
    }

    _pageController.nextPage(duration: Durations.medium1, curve: Curves.easeInOut);
  }

  void _previousPage() async {
    if (_currentPage == 0) {
      context.router.maybePop();
      return;
    }
    _pageController.previousPage(duration: Durations.medium1, curve: Curves.easeInOut);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final Texts lang = context.l10n;
    return PopScope(
      canPop: _currentPage == 0,
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
                subtitle: Text(pages[_currentPage].description(context), style: AppThemes.textTheme.titleMedium),
              ),
              const CustomDivider(height: 32),
              Card(
                child: ExpandablePageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (value) => setState(() {
                    _currentPage = value;
                  }),
                  children: pages.map((e) => e as Widget).toList(),
                ),
              ),
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
                  if (context.router.canNavigateBack || _currentPage > 0)
                    FilledButton(
                      style: theme.filledButtonTheme.style!.copyWith(backgroundColor: WidgetStatePropertyAll(theme.disabledColor)),
                      onPressed: provider.loggingIn ? null : _previousPage,
                      child: const Icon(Icons.arrow_back_outlined),
                    ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FilledButton(
                      onPressed: provider.loggingIn ? null : _nextPage,
                      child: Text(pages[_currentPage].buttonText(context)),
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
}
