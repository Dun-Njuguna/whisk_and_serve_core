import 'package:flutter/material.dart';

class CardColors {
  final Color color;
  final Color shadowColor;

  CardColors({required this.color, required this.shadowColor});
}

class ThemeUtils {
  static bool isLightTheme(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }

  static CardColors getCardColors(BuildContext context) {
    if (isLightTheme(context)) {
      return CardColors(
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
        shadowColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
      );
    } else {
      return CardColors(
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
        shadowColor: Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
      );
    }
  }
}
