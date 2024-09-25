// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:autojidelna/src/ui/pages/crashlytics_page.dart' as _i1;
import 'package:autojidelna/src/ui/pages/debug_page.dart' as _i2;
import 'package:autojidelna/src/ui/pages/demo_page.dart' as _i3;
import 'package:autojidelna/src/ui/pages/request_permission_page.dart' as _i5;
import 'package:autojidelna/src/ui/pages/router_page.dart' as _i6;
import 'package:autojidelna/src/ui/pages/settings/localization/localizations_page.dart'
    as _i4;
import 'package:autojidelna/src/ui/pages/settings/routing/routing_param_page.dart'
    as _i7;
import 'package:autojidelna/src/ui/pages/settings/routing/routing_path_param_detail_page.dart'
    as _i8;
import 'package:autojidelna/src/ui/pages/settings/routing/routing_query_param_detail_page.dart'
    as _i9;
import 'package:autojidelna/src/ui/pages/settings/settings_page.dart' as _i10;
import 'package:flutter/foundation.dart' as _i12;
import 'package:flutter/material.dart' as _i13;

/// generated route for
/// [_i1.CrashlyticsPage]
class CrashlyticsPage extends _i11.PageRouteInfo<void> {
  const CrashlyticsPage({List<_i11.PageRouteInfo>? children})
      : super(
          CrashlyticsPage.name,
          initialChildren: children,
        );

  static const String name = 'CrashlyticsPage';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i1.CrashlyticsPage();
    },
  );
}

/// generated route for
/// [_i2.DebugPage]
class DebugPage extends _i11.PageRouteInfo<void> {
  const DebugPage({List<_i11.PageRouteInfo>? children})
      : super(
          DebugPage.name,
          initialChildren: children,
        );

  static const String name = 'DebugPage';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i2.DebugPage();
    },
  );
}

/// generated route for
/// [_i3.DemoPage]
class DemoPage extends _i11.PageRouteInfo<void> {
  const DemoPage({List<_i11.PageRouteInfo>? children})
      : super(
          DemoPage.name,
          initialChildren: children,
        );

  static const String name = 'DemoPage';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i3.DemoPage();
    },
  );
}

/// generated route for
/// [_i4.LocalizationsPage]
class LocalizationsPage extends _i11.PageRouteInfo<void> {
  const LocalizationsPage({List<_i11.PageRouteInfo>? children})
      : super(
          LocalizationsPage.name,
          initialChildren: children,
        );

  static const String name = 'LocalizationsPage';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i4.LocalizationsPage();
    },
  );
}

/// generated route for
/// [_i5.RequestPermissionPage]
class RequestPermissionPage
    extends _i11.PageRouteInfo<RequestPermissionPageArgs> {
  RequestPermissionPage({
    _i12.Key? key,
    void Function(bool)? onResult,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          RequestPermissionPage.name,
          args: RequestPermissionPageArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'RequestPermissionPage';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RequestPermissionPageArgs>(
          orElse: () => const RequestPermissionPageArgs());
      return _i5.RequestPermissionPage(
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

  final _i12.Key? key;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'RequestPermissionPageArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [_i6.RouterPage]
class RouterPage extends _i11.PageRouteInfo<void> {
  const RouterPage({List<_i11.PageRouteInfo>? children})
      : super(
          RouterPage.name,
          initialChildren: children,
        );

  static const String name = 'RouterPage';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i6.RouterPage();
    },
  );
}

/// generated route for
/// [_i7.RoutingParamPage]
class RoutingParamPage extends _i11.PageRouteInfo<void> {
  const RoutingParamPage({List<_i11.PageRouteInfo>? children})
      : super(
          RoutingParamPage.name,
          initialChildren: children,
        );

  static const String name = 'RoutingParamPage';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i7.RoutingParamPage();
    },
  );
}

/// generated route for
/// [_i8.RoutingPathParamDetailPage]
class RoutingPathParamDetailPage
    extends _i11.PageRouteInfo<RoutingPathParamDetailPageArgs> {
  RoutingPathParamDetailPage({
    _i13.Key? key,
    required String filmid,
    List<_i11.PageRouteInfo>? children,
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

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<RoutingPathParamDetailPageArgs>(
          orElse: () => RoutingPathParamDetailPageArgs(
              filmid: pathParams.getString('filmid')));
      return _i8.RoutingPathParamDetailPage(
        key: args.key,
        filmid: args.filmid,
      );
    },
  );
}

class RoutingPathParamDetailPageArgs {
  const RoutingPathParamDetailPageArgs({
    this.key,
    required this.filmid,
  });

  final _i13.Key? key;

  final String filmid;

  @override
  String toString() {
    return 'RoutingPathParamDetailPageArgs{key: $key, filmid: $filmid}';
  }
}

/// generated route for
/// [_i9.RoutingQueryParamDetailPage]
class RoutingQueryParamDetailPage
    extends _i11.PageRouteInfo<RoutingQueryParamDetailPageArgs> {
  RoutingQueryParamDetailPage({
    _i13.Key? key,
    int? filmid,
    List<_i11.PageRouteInfo>? children,
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

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<RoutingQueryParamDetailPageArgs>(
          orElse: () => RoutingQueryParamDetailPageArgs(
              filmid: queryParams.optInt('key')));
      return _i9.RoutingQueryParamDetailPage(
        key: args.key,
        filmid: args.filmid,
      );
    },
  );
}

class RoutingQueryParamDetailPageArgs {
  const RoutingQueryParamDetailPageArgs({
    this.key,
    this.filmid,
  });

  final _i13.Key? key;

  final int? filmid;

  @override
  String toString() {
    return 'RoutingQueryParamDetailPageArgs{key: $key, filmid: $filmid}';
  }
}

/// generated route for
/// [_i10.SettingsPage]
class SettingsPage extends _i11.PageRouteInfo<void> {
  const SettingsPage({List<_i11.PageRouteInfo>? children})
      : super(
          SettingsPage.name,
          initialChildren: children,
        );

  static const String name = 'SettingsPage';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i10.SettingsPage();
    },
  );
}
