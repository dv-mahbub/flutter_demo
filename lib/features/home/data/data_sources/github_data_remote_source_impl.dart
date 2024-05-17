import 'package:dio/dio.dart';
import 'package:flutter_demo/core/services/dio_service.dart';
import 'package:flutter_demo/features/home/data/data_sources/github_data_remote_source.dart';
import 'package:flutter_demo/features/home/data/models/github_project_model.dart';

class GithubDataRemoteSourceImpl extends GithubDataRemoteSource {
  _searchQuearyPath(int page) =>
      "search/repositories?q=flutter&sort=stars&order=desc&page=$page&per_page=10";

  @override
  Future<GithubProjectModel?> searchGithubProject(int pageNumber) async {
    Response response = await makeRequest(
        path: _searchQuearyPath(pageNumber), method: HTTPMethod.get);

    return GithubProjectModel.fromJson(response.data);
  }
}
