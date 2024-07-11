// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:coree/src/ui/pages/crashlytics_page.dart' as _i1;
import 'package:coree/src/ui/pages/demo_page.dart' as _i2;
import 'package:coree/src/ui/pages/router_page.dart' as _i6;
import 'package:coree/src/ui/pages/settings/localization/localizations_page.dart'
    as _i3;
import 'package:coree/src/ui/pages/settings/login/login_page.dart' as _i4;
import 'package:coree/src/ui/pages/settings/login/secret_page.dart' as _i12;
import 'package:coree/src/ui/pages/settings/provider/provider_test_page.dart'
    as _i5;
import 'package:coree/src/ui/pages/settings/routing/routing_param_page.dart'
    as _i7;
import 'package:coree/src/ui/pages/settings/routing/routing_path_param_detail_page.dart'
    as _i8;
import 'package:coree/src/ui/pages/settings/routing/routing_query_param_detail_page.dart'
    as _i9;
import 'package:coree/src/ui/pages/settings/routing/routing_test_detail_detail_page.dart'
    as _i10;
import 'package:coree/src/ui/pages/settings/routing/routing_test_detail_page.dart'
    as _i11;
import 'package:coree/src/ui/pages/settings/settings_page.dart' as _i13;
import 'package:flutter/material.dart' as _i15;

abstract class $AppRouter extends _i14.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    CrashlyticsPage.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CrashlyticsPage(),
      );
    },
    DemoPage.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DemoPage(),
      );
    },
    LocalizationsPage.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LocalizationsPage(),
      );
    },
    LoginPage.name: (routeData) {
      final args =
          routeData.argsAs<LoginPageArgs>(orElse: () => const LoginPageArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.LoginPage(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    ProviderTestPage.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ProviderTestPage(),
      );
    },
    RouterPage.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.RouterPage(),
      );
    },
    RoutingParamPage.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.RoutingParamPage(),
      );
    },
    RoutingPathParamDetailPage.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RoutingPathParamDetailPageArgs>(
          orElse: () => RoutingPathParamDetailPageArgs(
              filmid: pathParams.getString('filmid')));
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.RoutingPathParamDetailPage(
          key: args.key,
          filmid: args.filmid,
        ),
      );
    },
    RoutingQueryParamDetailPage.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<RoutingQueryParamDetailPageArgs>(
          orElse: () => RoutingQueryParamDetailPageArgs(
              filmid: queryParams.optInt('key')));
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.RoutingQueryParamDetailPage(
          key: args.key,
          filmid: args.filmid,
        ),
      );
    },
    RoutingTestDetailDetail.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.RoutingTestDetailDetail(),
      );
    },
    RoutingTestDetailPage.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.RoutingTestDetailPage(),
      );
    },
    SecretPage.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SecretPage(),
      );
    },
    SettingsPage.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SettingsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CrashlyticsPage]
class CrashlyticsPage extends _i14.PageRouteInfo<void> {
  const CrashlyticsPage({List<_i14.PageRouteInfo>? children})
      : super(
          CrashlyticsPage.name,
          initialChildren: children,
        );

  static const String name = 'CrashlyticsPage';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DemoPage]
class DemoPage extends _i14.PageRouteInfo<void> {
  const DemoPage({List<_i14.PageRouteInfo>? children})
      : super(
          DemoPage.name,
          initialChildren: children,
        );

  static const String name = 'DemoPage';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LocalizationsPage]
class LocalizationsPage extends _i14.PageRouteInfo<void> {
  const LocalizationsPage({List<_i14.PageRouteInfo>? children})
      : super(
          LocalizationsPage.name,
          initialChildren: children,
        );

  static const String name = 'LocalizationsPage';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginPage]
class LoginPage extends _i14.PageRouteInfo<LoginPageArgs> {
  LoginPage({
    _i15.Key? key,
    dynamic Function(bool)? onResult,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          LoginPage.name,
          args: LoginPageArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginPage';

  static const _i14.PageInfo<LoginPageArgs> page =
      _i14.PageInfo<LoginPageArgs>(name);
}

class LoginPageArgs {
  const LoginPageArgs({
    this.key,
    this.onResult,
  });

  final _i15.Key? key;

  final dynamic Function(bool)? onResult;

  @override
  String toString() {
    return 'LoginPageArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [_i5.ProviderTestPage]
class ProviderTestPage extends _i14.PageRouteInfo<void> {
  const ProviderTestPage({List<_i14.PageRouteInfo>? children})
      : super(
          ProviderTestPage.name,
          initialChildren: children,
        );

  static const String name = 'ProviderTestPage';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RouterPage]
class RouterPage extends _i14.PageRouteInfo<void> {
  const RouterPage({List<_i14.PageRouteInfo>? children})
      : super(
          RouterPage.name,
          initialChildren: children,
        );

  static const String name = 'RouterPage';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i7.RoutingParamPage]
class RoutingParamPage extends _i14.PageRouteInfo<void> {
  const RoutingParamPage({List<_i14.PageRouteInfo>? children})
      : super(
          RoutingParamPage.name,
          initialChildren: children,
        );

  static const String name = 'RoutingParamPage';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i8.RoutingPathParamDetailPage]
class RoutingPathParamDetailPage
    extends _i14.PageRouteInfo<RoutingPathParamDetailPageArgs> {
  RoutingPathParamDetailPage({
    _i15.Key? key,
    required String filmid,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          RoutingPathParamDetailPage.name,
          args: RoutingPathParamDetailPageArgs(
            key: key,
            filmid: filmid,
          ),
          rawPathParams: {'filmid': filmid},
          initialChildren: children,
        );

  static const String name = 'RoutingPathParamDetailPage';

  static const _i14.PageInfo<RoutingPathParamDetailPageArgs> page =
      _i14.PageInfo<RoutingPathParamDetailPageArgs>(name);
}

class RoutingPathParamDetailPageArgs {
  const RoutingPathParamDetailPageArgs({
    this.key,
    required this.filmid,
  });

  final _i15.Key? key;

  final String filmid;

  @override
  String toString() {
    return 'RoutingPathParamDetailPageArgs{key: $key, filmid: $filmid}';
  }
}

/// generated route for
/// [_i9.RoutingQueryParamDetailPage]
class RoutingQueryParamDetailPage
    extends _i14.PageRouteInfo<RoutingQueryParamDetailPageArgs> {
  RoutingQueryParamDetailPage({
    _i15.Key? key,
    int? filmid,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          RoutingQueryParamDetailPage.name,
          args: RoutingQueryParamDetailPageArgs(
            key: key,
            filmid: filmid,
          ),
          rawQueryParams: {'key': filmid},
          initialChildren: children,
        );

  static const String name = 'RoutingQueryParamDetailPage';

  static const _i14.PageInfo<RoutingQueryParamDetailPageArgs> page =
      _i14.PageInfo<RoutingQueryParamDetailPageArgs>(name);
}

class RoutingQueryParamDetailPageArgs {
  const RoutingQueryParamDetailPageArgs({
    this.key,
    this.filmid,
  });

  final _i15.Key? key;

  final int? filmid;

  @override
  String toString() {
    return 'RoutingQueryParamDetailPageArgs{key: $key, filmid: $filmid}';
  }
}

/// generated route for
/// [_i10.RoutingTestDetailDetail]
class RoutingTestDetailDetail extends _i14.PageRouteInfo<void> {
  const RoutingTestDetailDetail({List<_i14.PageRouteInfo>? children})
      : super(
          RoutingTestDetailDetail.name,
          initialChildren: children,
        );

  static const String name = 'RoutingTestDetailDetail';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i11.RoutingTestDetailPage]
class RoutingTestDetailPage extends _i14.PageRouteInfo<void> {
  const RoutingTestDetailPage({List<_i14.PageRouteInfo>? children})
      : super(
          RoutingTestDetailPage.name,
          initialChildren: children,
        );

  static const String name = 'RoutingTestDetailPage';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SecretPage]
class SecretPage extends _i14.PageRouteInfo<void> {
  const SecretPage({List<_i14.PageRouteInfo>? children})
      : super(
          SecretPage.name,
          initialChildren: children,
        );

  static const String name = 'SecretPage';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SettingsPage]
class SettingsPage extends _i14.PageRouteInfo<void> {
  const SettingsPage({List<_i14.PageRouteInfo>? children})
      : super(
          SettingsPage.name,
          initialChildren: children,
        );

  static const String name = 'SettingsPage';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}
