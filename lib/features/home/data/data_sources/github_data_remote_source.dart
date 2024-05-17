import 'package:flutter_demo/features/home/data/models/github_project_model.dart';

abstract class GithubDataRemoteSource {
  Future<GithubProjectModel?> searchGithubProject(int pageNumber);
}
