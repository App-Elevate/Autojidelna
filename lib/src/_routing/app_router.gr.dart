// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:coree/src/ui/pages/crashlytics_page.dart' as _i1;
import 'package:coree/src/ui/pages/demo_page.dart' as _i2;
import 'package:coree/src/ui/pages/main_page.dart' as _i3;
import 'package:flutter/material.dart' as _i5;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    CrashlyticsPage.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CrashlyticsPage(),
      );
    },
    DemoPage.name: (routeData) {
      final args = routeData.argsAs<DemoPageArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.DemoPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    MainPage.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MainPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CrashlyticsPage]
class CrashlyticsPage extends _i4.PageRouteInfo<void> {
  const CrashlyticsPage({List<_i4.PageRouteInfo>? children})
      : super(
          CrashlyticsPage.name,
          initialChildren: children,
        );

  static const String name = 'CrashlyticsPage';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DemoPage]
class DemoPage extends _i4.PageRouteInfo<DemoPageArgs> {
  DemoPage({
    _i5.Key? key,
    required String title,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          DemoPage.name,
          args: DemoPageArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'DemoPage';

  static const _i4.PageInfo<DemoPageArgs> page =
      _i4.PageInfo<DemoPageArgs>(name);
}

class DemoPageArgs {
  const DemoPageArgs({
    this.key,
    required this.title,
  });

  final _i5.Key? key;

  final String title;

  @override
  String toString() {
    return 'DemoPageArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i3.MainPage]
class MainPage extends _i4.PageRouteInfo<void> {
  const MainPage({List<_i4.PageRouteInfo>? children})
      : super(
          MainPage.name,
          initialChildren: children,
        );

  static const String name = 'MainPage';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
