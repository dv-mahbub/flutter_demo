import 'package:flutter/material.dart';

import 'components/github_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Github Project"),
        backgroundColor: Colors.green[800],
      ),
      body: const GithubListWidget(),
    );
  }
}
