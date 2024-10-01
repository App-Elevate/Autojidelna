// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:autojidelna/src/ui/pages/debug_page.dart' as _i1;
import 'package:autojidelna/src/ui/pages/request_permission_page.dart' as _i2;
import 'package:autojidelna/src/ui/pages/router_page.dart' as _i3;
import 'package:flutter/foundation.dart' as _i5;

/// generated route for
/// [_i1.DebugPage]
class DebugPage extends _i4.PageRouteInfo<void> {
  const DebugPage({List<_i4.PageRouteInfo>? children})
      : super(
          DebugPage.name,
          initialChildren: children,
        );

  static const String name = 'DebugPage';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.DebugPage();
    },
  );
}

/// generated route for
/// [_i2.RequestPermissionPage]
class RequestPermissionPage
    extends _i4.PageRouteInfo<RequestPermissionPageArgs> {
  RequestPermissionPage({
    _i5.Key? key,
    void Function(bool)? onResult,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          RequestPermissionPage.name,
          args: RequestPermissionPageArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'RequestPermissionPage';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RequestPermissionPageArgs>(
          orElse: () => const RequestPermissionPageArgs());
      return _i2.RequestPermissionPage(
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

  final _i5.Key? key;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'RequestPermissionPageArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [_i3.RouterPage]
class RouterPage extends _i4.PageRouteInfo<void> {
  const RouterPage({List<_i4.PageRouteInfo>? children})
      : super(
          RouterPage.name,
          initialChildren: children,
        );

  static const String name = 'RouterPage';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.RouterPage();
    },
  );
}
