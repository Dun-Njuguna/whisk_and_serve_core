import 'package:flutter/material.dart';

/// Model for navigation item with icon, label, and route.
class NavItem {
  final IconData icon;
  final String label;
  final String route;

  NavItem({
    required this.icon,
    required this.label,
    required this.route,
  });
}
