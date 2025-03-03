import 'package:flutter/material.dart';
import 'package:whisk_and_serve_core/router/nav/navitem.dart';

class AppRoutes {
  static const String explore = '/';
  static const String favourites = '/favourites';
  static const String profile = '/profile';

  // Explore Child Routes
  static const String mealsPage = 'meals';
  static const String meals = '$mealsPage/:category';
}

/// List of navigation items.
final List<NavItem> navItems = [
  NavItem(
    icon: Icons.explore,
    label: 'Explore',
    route: AppRoutes.explore,
  ),
  NavItem(
    icon: Icons.favorite,
    label: 'Favorites',
    route: AppRoutes.favourites,
  ),
  NavItem(
    icon: Icons.person,
    label: 'Profile',
    route: AppRoutes.profile,
  ),
];
