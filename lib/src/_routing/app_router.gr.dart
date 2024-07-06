// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:coree/src/ui/pages/crashlytics_page.dart' as _i1;
import 'package:coree/src/ui/pages/demo_page.dart' as _i2;
import 'package:coree/src/ui/pages/router_page.dart' as _i4;
import 'package:coree/src/ui/pages/settings/localizations_page.dart' as _i3;
import 'package:coree/src/ui/pages/settings/routing/routing_param_page.dart'
    as _i5;
import 'package:coree/src/ui/pages/settings/routing/routing_path_param_detail_page.dart'
    as _i6;
import 'package:coree/src/ui/pages/settings/routing/routing_query_param_detail_page.dart'
    as _i7;
import 'package:coree/src/ui/pages/settings/routing/routing_test_detail_detail_page.dart'
    as _i8;
import 'package:coree/src/ui/pages/settings/routing/routing_test_detail_page.dart'
    as _i9;
import 'package:coree/src/ui/pages/settings/settings_page.dart' as _i10;
import 'package:flutter/material.dart' as _i12;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    CrashlyticsPage.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CrashlyticsPage(),
      );
    },
    DemoPage.name: (routeData) {
      final args =
          routeData.argsAs<DemoPageArgs>(orElse: () => const DemoPageArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.DemoPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    LocalizationsPage.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LocalizationsPage(),
      );
    },
    RouterPage.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.RouterPage(),
      );
    },
    RoutingParamPage.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RoutingParamPage(),
      );
    },
    RoutingPathParamDetailPage.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RoutingPathParamDetailPageArgs>(
          orElse: () => RoutingPathParamDetailPageArgs(
              filmid: pathParams.getString('filmid')));
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.RoutingPathParamDetailPage(
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
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.RoutingQueryParamDetailPage(
          key: args.key,
          filmid: args.filmid,
        ),
      );
    },
    RoutingTestDetailDetail.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.RoutingTestDetailDetail(),
      );
    },
    RoutingTestDetailPage.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.RoutingTestDetailPage(),
      );
    },
    RoutingTestPage.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.RoutingTestPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CrashlyticsPage]
class CrashlyticsPage extends _i11.PageRouteInfo<void> {
  const CrashlyticsPage({List<_i11.PageRouteInfo>? children})
      : super(
          CrashlyticsPage.name,
          initialChildren: children,
        );

  static const String name = 'CrashlyticsPage';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DemoPage]
class DemoPage extends _i11.PageRouteInfo<DemoPageArgs> {
  DemoPage({
    _i12.Key? key,
    String? title,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          DemoPage.name,
          args: DemoPageArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'DemoPage';

  static const _i11.PageInfo<DemoPageArgs> page =
      _i11.PageInfo<DemoPageArgs>(name);
}

class DemoPageArgs {
  const DemoPageArgs({
    this.key,
    this.title,
  });

  final _i12.Key? key;

  final String? title;

  @override
  String toString() {
    return 'DemoPageArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i3.LocalizationsPage]
class LocalizationsPage extends _i11.PageRouteInfo<void> {
  const LocalizationsPage({List<_i11.PageRouteInfo>? children})
      : super(
          LocalizationsPage.name,
          initialChildren: children,
        );

  static const String name = 'LocalizationsPage';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.RouterPage]
class RouterPage extends _i11.PageRouteInfo<void> {
  const RouterPage({List<_i11.PageRouteInfo>? children})
      : super(
          RouterPage.name,
          initialChildren: children,
        );

  static const String name = 'RouterPage';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.RoutingParamPage]
class RoutingParamPage extends _i11.PageRouteInfo<void> {
  const RoutingParamPage({List<_i11.PageRouteInfo>? children})
      : super(
          RoutingParamPage.name,
          initialChildren: children,
        );

  static const String name = 'RoutingParamPage';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RoutingPathParamDetailPage]
class RoutingPathParamDetailPage
    extends _i11.PageRouteInfo<RoutingPathParamDetailPageArgs> {
  RoutingPathParamDetailPage({
    _i12.Key? key,
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

  static const _i11.PageInfo<RoutingPathParamDetailPageArgs> page =
      _i11.PageInfo<RoutingPathParamDetailPageArgs>(name);
}

class RoutingPathParamDetailPageArgs {
  const RoutingPathParamDetailPageArgs({
    this.key,
    required this.filmid,
  });

  final _i12.Key? key;

  final String filmid;

  @override
  String toString() {
    return 'RoutingPathParamDetailPageArgs{key: $key, filmid: $filmid}';
  }
}

/// generated route for
/// [_i7.RoutingQueryParamDetailPage]
class RoutingQueryParamDetailPage
    extends _i11.PageRouteInfo<RoutingQueryParamDetailPageArgs> {
  RoutingQueryParamDetailPage({
    _i12.Key? key,
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

  static const _i11.PageInfo<RoutingQueryParamDetailPageArgs> page =
      _i11.PageInfo<RoutingQueryParamDetailPageArgs>(name);
}

class RoutingQueryParamDetailPageArgs {
  const RoutingQueryParamDetailPageArgs({
    this.key,
    this.filmid,
  });

  final _i12.Key? key;

  final int? filmid;

  @override
  String toString() {
    return 'RoutingQueryParamDetailPageArgs{key: $key, filmid: $filmid}';
  }
}

/// generated route for
/// [_i8.RoutingTestDetailDetail]
class RoutingTestDetailDetail extends _i11.PageRouteInfo<void> {
  const RoutingTestDetailDetail({List<_i11.PageRouteInfo>? children})
      : super(
          RoutingTestDetailDetail.name,
          initialChildren: children,
        );

  static const String name = 'RoutingTestDetailDetail';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.RoutingTestDetailPage]
class RoutingTestDetailPage extends _i11.PageRouteInfo<void> {
  const RoutingTestDetailPage({List<_i11.PageRouteInfo>? children})
      : super(
          RoutingTestDetailPage.name,
          initialChildren: children,
        );

  static const String name = 'RoutingTestDetailPage';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.RoutingTestPage]
class RoutingTestPage extends _i11.PageRouteInfo<void> {
  const RoutingTestPage({List<_i11.PageRouteInfo>? children})
      : super(
          RoutingTestPage.name,
          initialChildren: children,
        );

  static const String name = 'RoutingTestPage';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
