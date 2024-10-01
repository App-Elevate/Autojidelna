// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:autojidelna/src/ui/pages/dev/debug_page.dart' as _i6;
import 'package:autojidelna/src/ui/pages/menu_page.dart' as _i7;
import 'package:autojidelna/src/ui/pages/more/about_page.dart' as _i1;
import 'package:autojidelna/src/ui/pages/more/account_page.dart' as _i2;
import 'package:autojidelna/src/ui/pages/more/statistics_page.dart' as _i12;
import 'package:autojidelna/src/ui/pages/more_page.dart' as _i8;
import 'package:autojidelna/src/ui/pages/request_permission_page.dart' as _i9;
import 'package:autojidelna/src/ui/pages/router_page.dart' as _i10;
import 'package:autojidelna/src/ui/pages/settings/analytics_page.dart' as _i3;
import 'package:autojidelna/src/ui/pages/settings/appearance_page.dart' as _i4;
import 'package:autojidelna/src/ui/pages/settings/convenience_page.dart' as _i5;
import 'package:autojidelna/src/ui/pages/settings/settings_page.dart' as _i11;
import 'package:flutter/foundation.dart' as _i14;

/// generated route for
/// [_i1.AboutPage]
class AboutPage extends _i13.PageRouteInfo<void> {
  const AboutPage({List<_i13.PageRouteInfo>? children})
      : super(
          AboutPage.name,
          initialChildren: children,
        );

  static const String name = 'AboutPage';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i1.AboutPage();
    },
  );
}

/// generated route for
/// [_i2.AccountPage]
class AccountPage extends _i13.PageRouteInfo<void> {
  const AccountPage({List<_i13.PageRouteInfo>? children})
      : super(
          AccountPage.name,
          initialChildren: children,
        );

  static const String name = 'AccountPage';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i2.AccountPage();
    },
  );
}

/// generated route for
/// [_i3.AnalyticsPage]
class AnalyticsPage extends _i13.PageRouteInfo<void> {
  const AnalyticsPage({List<_i13.PageRouteInfo>? children})
      : super(
          AnalyticsPage.name,
          initialChildren: children,
        );

  static const String name = 'AnalyticsPage';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i3.AnalyticsPage();
    },
  );
}

/// generated route for
/// [_i4.AppearancePage]
class AppearancePage extends _i13.PageRouteInfo<void> {
  const AppearancePage({List<_i13.PageRouteInfo>? children})
      : super(
          AppearancePage.name,
          initialChildren: children,
        );

  static const String name = 'AppearancePage';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i4.AppearancePage();
    },
  );
}

/// generated route for
/// [_i5.ConveniencePage]
class ConveniencePage extends _i13.PageRouteInfo<void> {
  const ConveniencePage({List<_i13.PageRouteInfo>? children})
      : super(
          ConveniencePage.name,
          initialChildren: children,
        );

  static const String name = 'ConveniencePage';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i5.ConveniencePage();
    },
  );
}

/// generated route for
/// [_i6.DebugPage]
class DebugPage extends _i13.PageRouteInfo<void> {
  const DebugPage({List<_i13.PageRouteInfo>? children})
      : super(
          DebugPage.name,
          initialChildren: children,
        );

  static const String name = 'DebugPage';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i6.DebugPage();
    },
  );
}

/// generated route for
/// [_i7.MenuPage]
class MenuPage extends _i13.PageRouteInfo<void> {
  const MenuPage({List<_i13.PageRouteInfo>? children})
      : super(
          MenuPage.name,
          initialChildren: children,
        );

  static const String name = 'MenuPage';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i7.MenuPage();
    },
  );
}

/// generated route for
/// [_i8.MorePage]
class MorePage extends _i13.PageRouteInfo<void> {
  const MorePage({List<_i13.PageRouteInfo>? children})
      : super(
          MorePage.name,
          initialChildren: children,
        );

  static const String name = 'MorePage';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i8.MorePage();
    },
  );
}

/// generated route for
/// [_i9.RequestPermissionPage]
class RequestPermissionPage
    extends _i13.PageRouteInfo<RequestPermissionPageArgs> {
  RequestPermissionPage({
    _i14.Key? key,
    void Function(bool)? onResult,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          RequestPermissionPage.name,
          args: RequestPermissionPageArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'RequestPermissionPage';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RequestPermissionPageArgs>(
          orElse: () => const RequestPermissionPageArgs());
      return _i9.RequestPermissionPage(
        key: args.key,
        onResult: args.onResult,
      );
    },
  );
}

class RequestPermissionPageArgs {
  const RequestPermissionPageArgs({
    this.key,
    this.onResult,
  });

  final _i14.Key? key;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'RequestPermissionPageArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [_i10.RouterPage]
class RouterPage extends _i13.PageRouteInfo<void> {
  const RouterPage({List<_i13.PageRouteInfo>? children})
      : super(
          RouterPage.name,
          initialChildren: children,
        );

  static const String name = 'RouterPage';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i10.RouterPage();
    },
  );
}

/// generated route for
/// [_i11.SettingsPage]
class SettingsPage extends _i13.PageRouteInfo<void> {
  const SettingsPage({List<_i13.PageRouteInfo>? children})
      : super(
          SettingsPage.name,
          initialChildren: children,
        );

  static const String name = 'SettingsPage';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i11.SettingsPage();
    },
  );
}

/// generated route for
/// [_i12.StatisticsPage]
class StatisticsPage extends _i13.PageRouteInfo<void> {
  const StatisticsPage({List<_i13.PageRouteInfo>? children})
      : super(
          StatisticsPage.name,
          initialChildren: children,
        );

  static const String name = 'StatisticsPage';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i12.StatisticsPage();
    },
  );
}
