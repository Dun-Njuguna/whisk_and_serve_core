import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whisk_and_serve_core/router/nav/custom_nav_bar.dart';

/// A [BaseScaffold] widget that includes a body and the singleton [CustomNavBar]
/// at the bottom. This class acts as a base layout for screens requiring bottom navigation.
class BaseScaffold extends StatelessWidget {
  final Widget child;
  final String? title;

  const BaseScaffold({
    required this.child,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: SafeArea(
              child: Stack(
                children: [
                  child,
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CustomNavBar.instance,
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  child,
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CustomNavBar.instance,
                  ),
                ],
              ),
            ),
          );
  }
}
