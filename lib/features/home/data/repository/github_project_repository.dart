import '../models/github_project_model.dart';

abstract class GithubProjectRepository {
  Future<GithubProjectModel?> searchGithubProject(int pageNumber);
}
