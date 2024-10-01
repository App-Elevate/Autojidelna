// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:autojidelna/src/ui/pages/dev/debug_page.dart' as _i1;
import 'package:autojidelna/src/ui/pages/menu_page.dart' as _i2;
import 'package:autojidelna/src/ui/pages/more_page.dart' as _i3;
import 'package:autojidelna/src/ui/pages/request_permission_page.dart' as _i4;
import 'package:autojidelna/src/ui/pages/router_page.dart' as _i5;
import 'package:flutter/foundation.dart' as _i7;

/// generated route for
/// [_i1.DebugPage]
class DebugPage extends _i6.PageRouteInfo<void> {
  const DebugPage({List<_i6.PageRouteInfo>? children})
      : super(
          DebugPage.name,
          initialChildren: children,
        );

  static const String name = 'DebugPage';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.DebugPage();
    },
  );
}

/// generated route for
/// [_i2.MenuPage]
class MenuPage extends _i6.PageRouteInfo<void> {
  const MenuPage({List<_i6.PageRouteInfo>? children})
      : super(
          MenuPage.name,
          initialChildren: children,
        );

  static const String name = 'MenuPage';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.MenuPage();
    },
  );
}

/// generated route for
/// [_i3.MorePage]
class MorePage extends _i6.PageRouteInfo<void> {
  const MorePage({List<_i6.PageRouteInfo>? children})
      : super(
          MorePage.name,
          initialChildren: children,
        );

  static const String name = 'MorePage';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.MorePage();
    },
  );
}

/// generated route for
/// [_i4.RequestPermissionPage]
class RequestPermissionPage
    extends _i6.PageRouteInfo<RequestPermissionPageArgs> {
  RequestPermissionPage({
    _i7.Key? key,
    void Function(bool)? onResult,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          RequestPermissionPage.name,
          args: RequestPermissionPageArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'RequestPermissionPage';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RequestPermissionPageArgs>(
          orElse: () => const RequestPermissionPageArgs());
      return _i4.RequestPermissionPage(
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

  final _i7.Key? key;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'RequestPermissionPageArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [_i5.RouterPage]
class RouterPage extends _i6.PageRouteInfo<void> {
  const RouterPage({List<_i6.PageRouteInfo>? children})
      : super(
          RouterPage.name,
          initialChildren: children,
        );

  static const String name = 'RouterPage';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.RouterPage();
    },
  );
}
