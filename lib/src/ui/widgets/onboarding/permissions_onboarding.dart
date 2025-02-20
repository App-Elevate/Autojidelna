import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:autojidelna/src/types/onboarding_step.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class PermissionsOnboarding extends StatefulWidget implements OnboardingStep {
  const PermissionsOnboarding({super.key});

  @override
  State<PermissionsOnboarding> createState() => _PermissionsOnboardingState();

  @override
  Future<bool> onNextPage(BuildContext context) async => true;

  @override
  String buttonText(BuildContext context) => context.l10n.next;

  @override
  String description(BuildContext context) => context.l10n.onboardingSubtitle;
}

class _PermissionsOnboardingState extends State<PermissionsOnboarding> {
  bool notificationsEnabled = false;

  void checkNotificationPermissions() async {
    final permissions = await AwesomeNotifications().checkPermissionList();
    setState(() {
      notificationsEnabled = permissions.contains(NotificationPermission.Alert);
    });
  }

  @override
  void initState() {
    super.initState();
    checkNotificationPermissions();
  }

  @override
  Widget build(BuildContext context) {
    final Texts lang = context.l10n;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(lang.allowNotifications),
            subtitle: Text(lang.allowNotifcitaionsReasons),
            trailing: OutlinedButton(
              onPressed: notificationsEnabled
                  ? null
                  : () async {
                      bool value = await AwesomeNotifications().requestPermissionToSendNotifications();
                      setState(() {
                        notificationsEnabled = value;
                      });
                    },
              child: notificationsEnabled ? const Icon(Icons.check) : Text(lang.grant),
            ),
          ),
          const CustomDivider(isTransparent: false),
          // TODO: fix when analitics are done
          const SwitchListTile(title: Text('Posilat crash logy'), subtitle: Text('crash log'), value: true, onChanged: null),
          const SwitchListTile(title: Text('Posilat data'), subtitle: Text('data'), value: true, onChanged: null),
        ],
      ),
    );
  }
}
