import 'package:flutter/material.dart';

class APPErrorWidget extends StatelessWidget {
  final String message;
  const APPErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Text(message);
  }
}
