import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whisk_and_serve_core/router/nav/navitem.dart';

/// A [CustomNavBar] widget that acts as a singleton,
/// ensuring that only one instance of the navigation bar exists.
/// This is a stateful widget to handle bottom navigation interactions
/// with smooth animations between navigation items.
class CustomNavBar extends StatefulWidget {
  // Singleton instance of CustomNavBar
  static final CustomNavBar instance = CustomNavBar._internal();

  // List of navigation items
  late final List<NavItem> navItems;

  // Private named constructor to restrict direct instantiation, initializing `navItems` as an empty list
  CustomNavBar._internal() : navItems = [];

  /// Factory constructor that returns the singleton instance of [CustomNavBar].
  /// Ensures `navItems` is only set once during the first instantiation.
  factory CustomNavBar({required List<NavItem> navItems}) {
    if (instance.navItems.isEmpty) {
      instance.navItems.addAll(navItems);
    }
    return instance;
  }

  @override
  CustomNavBarState createState() => CustomNavBarState();
}

class CustomNavBarState extends State<CustomNavBar> {
  int currentIndex = 0;

  /// Updates the current selected index and performs navigation
  /// based on the selected item index.
  void onItemTapped(BuildContext context, int index) {
    setState(() {
      currentIndex = index;
    });
    context.go(widget.navItems[index].route);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Card(
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
        margin: const EdgeInsets.only(bottom: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: widget.navItems.asMap().entries.map((entry) {
              return _buildNavItem(
                context: context,
                index: entry.key,
                navItem: entry.value,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  /// Builds an individual navigation item for the bottom bar.
  /// The item is rounded, animated, and responds to tap gestures.
  ///
  /// The [isSelected] state determines the appearance and size of the item.
  Widget _buildNavItem({
    required BuildContext context,
    required int index,
    required NavItem navItem,
  }) {
    bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(context, index),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 100),
          width: isSelected ? 110 : 90,
          height: 40,
          curve: Curves.easeIn,
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.primary.withOpacity(0.8)
                : Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Wrap(
            alignment: WrapAlignment.center, // Centers the content horizontally
            crossAxisAlignment:
                WrapCrossAlignment.center, // Centers content vertically
            children: [
              Icon(
                navItem.icon,
                color: isSelected ? Colors.white : Colors.black,
              ),
              if (isSelected) const SizedBox(width: 8),
              if (isSelected)
                Text(
                  navItem.label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
