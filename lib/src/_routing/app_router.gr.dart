// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:coree/src/ui/pages/crashlytics_page.dart' as _i1;
import 'package:coree/src/ui/pages/demo_page.dart' as _i2;
import 'package:coree/src/ui/pages/router_page.dart' as _i3;
import 'package:coree/src/ui/pages/routing_test_detail_page.dart' as _i4;
import 'package:coree/src/ui/pages/routing_test_page.dart' as _i5;
import 'package:flutter/material.dart' as _i7;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    CrashlyticsPage.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CrashlyticsPage(),
      );
    },
    DemoPage.name: (routeData) {
      final args =
          routeData.argsAs<DemoPageArgs>(orElse: () => const DemoPageArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.DemoPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    RouterPage.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.RouterPage(),
      );
    },
    RoutingTestDetailPage.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.RoutingTestDetailPage(),
      );
    },
    RoutingTestPage.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RoutingTestPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CrashlyticsPage]
class CrashlyticsPage extends _i6.PageRouteInfo<void> {
  const CrashlyticsPage({List<_i6.PageRouteInfo>? children})
      : super(
          CrashlyticsPage.name,
          initialChildren: children,
        );

  static const String name = 'CrashlyticsPage';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DemoPage]
class DemoPage extends _i6.PageRouteInfo<DemoPageArgs> {
  DemoPage({
    _i7.Key? key,
    String title = 'Demo Page',
    List<_i6.PageRouteInfo>? children,
  }) : super(
          DemoPage.name,
          args: DemoPageArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'DemoPage';

  static const _i6.PageInfo<DemoPageArgs> page =
      _i6.PageInfo<DemoPageArgs>(name);
}

class DemoPageArgs {
  const DemoPageArgs({
    this.key,
    this.title = 'Demo Page',
  });

  final _i7.Key? key;

  final String title;

  @override
  String toString() {
    return 'DemoPageArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i3.RouterPage]
class RouterPage extends _i6.PageRouteInfo<void> {
  const RouterPage({List<_i6.PageRouteInfo>? children})
      : super(
          RouterPage.name,
          initialChildren: children,
        );

  static const String name = 'RouterPage';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.RoutingTestDetailPage]
class RoutingTestDetailPage extends _i6.PageRouteInfo<void> {
  const RoutingTestDetailPage({List<_i6.PageRouteInfo>? children})
      : super(
          RoutingTestDetailPage.name,
          initialChildren: children,
        );

  static const String name = 'RoutingTestDetailPage';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.RoutingTestPage]
class RoutingTestPage extends _i6.PageRouteInfo<void> {
  const RoutingTestPage({List<_i6.PageRouteInfo>? children})
      : super(
          RoutingTestPage.name,
          initialChildren: children,
        );

  static const String name = 'RoutingTestPage';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
