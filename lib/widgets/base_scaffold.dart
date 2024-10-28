import 'package:flutter/material.dart';
import 'package:whisk_and_serve_core/router/nav/custom_nav_bar.dart';

/// A [BaseScaffold] widget that includes a body and the singleton [CustomNavBar]
/// at the bottom. This class acts as a base layout for screens requiring bottom navigation.
class BaseScaffold extends StatelessWidget {
  final Widget child;

  const BaseScaffold({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        child,
        CustomNavBar.instance,
      ],
    ));
  }
}
