import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';
import 'package:whisk_and_serve_core/router/app_routes.dart';
import 'package:whisk_and_serve_core/router/nav/custom_nav_bar.dart';

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
    final String? currentRoute = GoRouterState.of(context).fullPath;
    final bool showNavBar = navItems.any((item) => item.route == currentRoute);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: title != null ? CustomAppBar(title: title!) : null,
        body: Padding(
          padding: EdgeInsets.only(
            top: showNavBar ? 30 : 0,
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: child,
              ),
              if (showNavBar)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: CustomNavBar.instance,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Custom AppBar Widget
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.primary,
      leading: Navigator.canPop(context)
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
