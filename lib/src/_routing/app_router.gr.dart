// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:coree/src/ui/pages/crashlytics_page.dart' as _i1;
import 'package:coree/src/ui/pages/demo_page.dart' as _i2;
import 'package:coree/src/ui/pages/router_page.dart' as _i3;
import 'package:coree/src/ui/pages/routing_test_detail_detail.dart' as _i4;
import 'package:coree/src/ui/pages/routing_test_detail_page.dart' as _i5;
import 'package:coree/src/ui/pages/routing_test_page.dart' as _i6;
import 'package:flutter/material.dart' as _i8;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    CrashlyticsPage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CrashlyticsPage(),
      );
    },
    DemoPage.name: (routeData) {
      final args =
          routeData.argsAs<DemoPageArgs>(orElse: () => const DemoPageArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.DemoPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    RouterPage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.RouterPage(),
      );
    },
    RoutingTestDetailDetail.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.RoutingTestDetailDetail(),
      );
    },
    RoutingTestDetailPage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RoutingTestDetailPage(),
      );
    },
    RoutingTestPage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.RoutingTestPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CrashlyticsPage]
class CrashlyticsPage extends _i7.PageRouteInfo<void> {
  const CrashlyticsPage({List<_i7.PageRouteInfo>? children})
      : super(
          CrashlyticsPage.name,
          initialChildren: children,
        );

  static const String name = 'CrashlyticsPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DemoPage]
class DemoPage extends _i7.PageRouteInfo<DemoPageArgs> {
  DemoPage({
    _i8.Key? key,
    String title = 'Demo Page',
    List<_i7.PageRouteInfo>? children,
  }) : super(
          DemoPage.name,
          args: DemoPageArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'DemoPage';

  static const _i7.PageInfo<DemoPageArgs> page =
      _i7.PageInfo<DemoPageArgs>(name);
}

class DemoPageArgs {
  const DemoPageArgs({
    this.key,
    this.title = 'Demo Page',
  });

  final _i8.Key? key;

  final String title;

  @override
  String toString() {
    return 'DemoPageArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i3.RouterPage]
class RouterPage extends _i7.PageRouteInfo<void> {
  const RouterPage({List<_i7.PageRouteInfo>? children})
      : super(
          RouterPage.name,
          initialChildren: children,
        );

  static const String name = 'RouterPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.RoutingTestDetailDetail]
class RoutingTestDetailDetail extends _i7.PageRouteInfo<void> {
  const RoutingTestDetailDetail({List<_i7.PageRouteInfo>? children})
      : super(
          RoutingTestDetailDetail.name,
          initialChildren: children,
        );

  static const String name = 'RoutingTestDetailDetail';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.RoutingTestDetailPage]
class RoutingTestDetailPage extends _i7.PageRouteInfo<void> {
  const RoutingTestDetailPage({List<_i7.PageRouteInfo>? children})
      : super(
          RoutingTestDetailPage.name,
          initialChildren: children,
        );

  static const String name = 'RoutingTestDetailPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RoutingTestPage]
class RoutingTestPage extends _i7.PageRouteInfo<void> {
  const RoutingTestPage({List<_i7.PageRouteInfo>? children})
      : super(
          RoutingTestPage.name,
          initialChildren: children,
        );

  static const String name = 'RoutingTestPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
