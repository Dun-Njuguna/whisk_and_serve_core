import 'package:flutter/widgets.dart';

// A class representing a route configuration for each module
class AppRouteConfig {
  final String parentPath;
  final Widget parentWidget;
  final List<ChildRouteConfig> childRoutes;

  AppRouteConfig({
    required this.parentPath,
    required this.parentWidget,
    this.childRoutes = const [],
  });
}

class ChildRouteConfig {
  final String path;
  final Widget childWidget;

  ChildRouteConfig({
    required this.path,
    required this.childWidget,
  });
}
