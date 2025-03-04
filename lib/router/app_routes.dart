import 'package:flutter/material.dart';
import 'package:whisk_and_serve_core/router/nav/navitem.dart';

class AppRoutes {
  static const String explore = '/';
  static const String favourites = '/favourites';
  static const String profile = '/profile';

  // Explore Child Routes
  static const String meals = 'meals';
  static const String mealsPage = '$meals/:category';
  static const String mealDetails = '$meals/:mealId';

  static const String mealDetailPathParam = ":mealId";
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
