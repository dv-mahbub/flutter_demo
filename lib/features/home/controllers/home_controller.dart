import 'package:flutter_demo/core/base/base_controller.dart';
import 'package:flutter_demo/core/models/view_state.dart';
import 'package:flutter_demo/features/home/data/repository/github_project_repository.dart';
import 'package:get/get.dart';

import '../data/models/github_project_model.dart';

class HomeController extends BaseController {
  // Repository for fetching GitHub projects data
  final GithubProjectRepository _githubProjectRepository;

  // Constructor to initialize the repository
  HomeController(this._githubProjectRepository);

  // Model to hold GitHub project data
  GithubProjectModel? githubProjectModel;

  // Observable to track the current page for pagination
  var currentPage = 1.obs;
  RxBool isFullyLoaded = false.obs;
  // Method to fetch GitHub Flutter projects
  Future<void> getGithubFlutterProjects() async {
    try {
      viewState.value = ViewState.loading;
      // Fetch projects from the repository based on the current page
      final githubResponse =
          await _githubProjectRepository.searchGithubProject(currentPage.value);
      if (githubResponse?.items == null && githubResponse!.items!.isEmpty) {
        isFullyLoaded.value = true;
      }
      // If the model is null, initialize it with the response
      // Otherwise, append new items to the existing list
      if (githubProjectModel == null) {
        githubProjectModel = githubResponse;
      } else {
        githubProjectModel?.items?.addAll(githubResponse!.items!);
      }

      // Update the view state to loaded
      viewState.value = ViewState.loaded;

      // Increment the page number for the next fetch
      currentPage.value++;
    } catch (e) {
      // Print error and set the exception in case of failure
      e.toString().printError();
      setException = e;
    }
  }

  @override
  void onInit() {
    // Fetch projects when the controller is initialized
    getGithubFlutterProjects();
    super.onInit();
  }
}
