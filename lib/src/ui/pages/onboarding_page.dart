import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_global/providers/account.provider.dart';
import 'package:autojidelna/src/_global/providers/canteen.provider.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/theme/app_themes.dart';
import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:autojidelna/src/ui/widgets/onboarding/permissions_onboarding.dart';
import 'package:autojidelna/src/ui/widgets/onboarding/theme_onboarding.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key, this.onCompletedCallback});
  final void Function(bool onSuccess)? onCompletedCallback;

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _pageController;
  int _currentPage = 0;

  final List<Widget> pages = [
    const ThemeOnboarding(),
    const PermissionsOnboarding(),
  ];

  void _nextPage() async {
    if (_currentPage < pages.length - 1) {
      _pageController.nextPage(
        duration: Durations.medium1,
        curve: Curves.easeInOut,
      );
    } else {
      // TODO: Navigate to home, login screen or account picker
      if (widget.onCompletedCallback == null) {
        context.router.maybePop();
        return;
      }
      widget.onCompletedCallback!(true);
    }
  }

  void _previousPage() async {
    if (_currentPage == 0) return;

    _pageController.previousPage(
      duration: Durations.medium1,
      curve: Curves.easeInOut,
    );
  }

  void seemlessLogin() async {
    final UserProvider prov = context.read<UserProvider>();
    try {
      if (prov.user == null) await prov.loadUser();
      try {
        if (mounted) context.read<CanteenProvider>().preIndexMenus();
      } catch (_) {} // Just QoL
    } catch (_) {} // This can be solved later by AuthGuard()
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    seemlessLogin();
  }

  @override
  Widget build(BuildContext context) {
    final Texts lang = context.l10n;
    return PopScope(
      canPop: _currentPage == 0,
      child: Scaffold(
        appBar: AppBar(forceMaterialTransparency: true, automaticallyImplyLeading: false),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.rocket_launch_outlined, size: 55, color: Theme.of(context).colorScheme.primary),
            ),
            ListTile(
              title: Text(lang.welcome, style: AppThemes.textTheme.displaySmall),
              subtitle: Text(lang.onboardingSubtitle, style: AppThemes.textTheme.titleMedium),
            ),
            const CustomDivider(height: 8),
            Card(
              child: ExpandablePageView(
                controller: _pageController,
                onPageChanged: (value) => setState(() {
                  _currentPage = value;
                }),
                children: pages,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Row(
            children: [
              if (_currentPage != 0)
                FilledButton(
                  style:
                      Theme.of(context).filledButtonTheme.style!.copyWith(backgroundColor: WidgetStatePropertyAll(Theme.of(context).disabledColor)),
                  onPressed: _previousPage,
                  child: const Icon(Icons.arrow_back_outlined),
                ),
              const SizedBox(width: 8),
              Expanded(
                child: FilledButton(
                  onPressed: _nextPage,
                  child: Text(_currentPage == pages.length - 1 ? lang.getStarted : lang.next),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
