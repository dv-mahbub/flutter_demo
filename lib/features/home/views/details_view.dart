import 'package:flutter/material.dart';
import 'package:flutter_demo/features/home/data/models/github_project_model.dart';

class GithubDetailsScreen extends StatelessWidget {
  final Item? item;
  const GithubDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${item?.name}"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("name: ${item?.name}"),
              Text("Description: ${item?.description}"),
              Text("Update at:${item?.updatedAt}"),
            ],
          ),
        ),
      ),
    );
  }
}
