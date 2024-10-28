import 'package:flutter/material.dart';
import 'package:whisk_and_serve_core/theme/theme_utils.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final double elevation;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry borderRadius;

  const AppCard({
    super.key,
    required this.child,
    this.elevation = 8.0,
    this.margin,
    this.borderRadius = const BorderRadius.all(Radius.circular(30)),
  });

  @override
  Widget build(BuildContext context) {
    final cardColors = ThemeUtils.getCardColors(context);

    return Card(
      elevation: elevation,
      color: cardColors.color,
      shadowColor: cardColors.shadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      margin: margin,
      child: child,
    );
  }
}
