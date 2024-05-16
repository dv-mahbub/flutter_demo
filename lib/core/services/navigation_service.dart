import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
}

extension Navigation on Widget {
  // Function to push a new screen onto the navigator stack.
  Future push({
    BuildContext? context, // Optional context for navigation
  }) async {
    return await Navigator.push(
      context ??
          NavigationService
              .key.currentContext!, // Use Global if context is not provided
      MaterialPageRoute(
        builder: (context) => this, // Build the screen
      ),
    );
  }

// Function to completely replace the current screen with a new one.
  Future pushReplacement({
    BuildContext? context, // Optional context for navigation
  }) {
    return Navigator.pushReplacement(
      context ??
          NavigationService
              .key.currentContext!, // Use Global if context is not provided
      MaterialPageRoute(
        builder: (context) => this, // Build the replacement screen
      ),
    );
  }

// Function to push a new screen and remove all previous screens from the stack.
  Future pushAndRemoveUntil({
    BuildContext? context, // Optional context for navigation
  }) {
    return Navigator.pushAndRemoveUntil(
        context ??
            NavigationService
                .key.currentContext!, // Use Global if context is not provided
        MaterialPageRoute(
          builder: (context) => this, // Build the screen
        ),
        (route) => false); // Remove all previous screens
  }

// Function to pop the current screen from the navigator stack.
  static void pop(
      {BuildContext? context, // Optional context for navigation
      String? msg}) {
    return Navigator.pop(context ?? NavigationService.key.currentContext!,
        msg); // Use Global if context is not provided
  }
}
