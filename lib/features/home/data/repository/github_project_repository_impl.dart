import 'package:flutter_demo/features/home/data/data_sources/github_data_remote_source.dart';
import 'package:flutter_demo/features/home/data/models/github_project_model.dart';
import 'package:flutter_demo/features/home/data/repository/github_project_repository.dart';

class GithubProjectRepositoryImpl implements GithubProjectRepository {
  final GithubDataRemoteSource _githubDataRemoteSource;

  GithubProjectRepositoryImpl(GithubDataRemoteSource githubDataRemoteSource)
      : _githubDataRemoteSource = githubDataRemoteSource;

  @override
  Future<GithubProjectModel?> searchGithubProject(int pageNumber) async {
    return _githubDataRemoteSource.searchGithubProject(pageNumber);
  }
}
