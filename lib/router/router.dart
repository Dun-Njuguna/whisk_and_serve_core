import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whisk_and_serve_core/router/app_route_config.dart';
import 'package:whisk_and_serve_core/widgets/base_scaffold.dart';

/// The main [GoRouter] instance responsible for handling navigation throughout the app.
/// It uses a [ShellRoute] to provide a common base layout (e.g., [BaseScaffold])
/// for all screens while preserving the bottom navigation bar.
GoRouter router({required List<RouteBase> routes}) => GoRouter(
      routes: <RouteBase>[
        ShellRoute(
          navigatorKey: GlobalKey<NavigatorState>(),
          builder: (context, state, child) {
            return BaseScaffold(child: child);
          },
          routes: routes,
        ),
      ],
    );

// Converts AppRouteConfig to GoRoute for GoRouter usage
GoRoute createGoRoute(AppRouteConfig config) {
  return GoRoute(
    path: config.parentPath,
    pageBuilder: (context, state) => MaterialPage(
      child: config.parentWidget,
    ),
    routes: config.childRoutes.map((child) {
      return GoRoute(
        path: child.path,
        pageBuilder: (context, state) => MaterialPage(
          child: child.childWidget,
        ),
        routes: child.childRoutes.map((subChild) {
          return GoRoute(
            path: subChild.path,
            pageBuilder: (context, state) => MaterialPage(
              child: subChild.childWidget,
            ),
          );
        }).toList(),
      );
    }).toList(),
  );
}

/// A helper function that wraps the widget with a custom transition when navigating between screens.
///
/// [child] - The widget representing the new page.
/// [state] - The current state of the [GoRouter], used to retrieve the unique [pageKey].
///
/// The function uses a [FadeTransition] to smoothly transition between pages, with adjustable
/// [transitionDuration] and [reverseTransitionDuration].
CustomTransitionPage buildPageWithTransition(
    Widget child, GoRouterState state) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 300),
  );
}

class NavigationHelper {
  static void navigateTo(BuildContext context, String path) {
    context.push(path);
  }

  static String getPathParameter(BuildContext context, String key) {
    return GoRouterState.of(context).pathParameters[key] ?? 'Unknown';
  }

  static String getPath(BuildContext context) {
    return GoRouterState.of(context).path ?? 'Unknown';
  }
}
