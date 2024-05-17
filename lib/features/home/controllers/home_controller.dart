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

  // Observable list to store GitHub project items
  final RxList<GithubItem> githubProjectList = <GithubItem>[].obs;

  // Observable to track the current page for pagination
  final RxInt currentPage = 1.obs;

  // Observable to track if all pages are fully loaded
  final RxBool isFullyLoaded = false.obs;

  @override
  void onInit() {
    // Fetch projects when the controller is initialized
    fetchGithubFlutterProjects();
    super.onInit();
  }

  // Method to fetch GitHub Flutter projects
  Future<void> fetchGithubFlutterProjects() async {
    try {
      // Fetch projects from the repository based on the current page
      final githubResponse =
          await _githubProjectRepository.searchGithubProject(currentPage.value);

      // Check if the response is null or contains no items
      if (githubResponse == null ||
          githubResponse.items == null ||
          githubResponse.items!.isEmpty) {
        viewState.value = ViewState.empty;
        isFullyLoaded.value = true;
        return;
      }

      // Append new items to the existing list
      githubProjectList.addAll(githubResponse.items!);

      // Update the view state to loaded
      viewState.value = ViewState.loaded;

      // Increment the page number for the next fetch
      currentPage.value++;
    } catch (e) {
      // Print error and set the exception in case of failure
      printError('Failed to fetch GitHub projects: $e');
      setException = e;
    }
  }

  void printError(String message) {
    message.printError();
  }
}
