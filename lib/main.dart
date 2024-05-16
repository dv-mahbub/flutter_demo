import 'package:flutter/material.dart';
import 'package:flutter_demo/features/home/views/home_screen.dart';
import 'package:flutter_demo/services/navigation_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.key,
      home: const HomeScreen(),
    );
  }
}
