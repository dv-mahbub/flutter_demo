import 'package:flutter_demo/features/home/controllers/home_controller.dart';
import 'package:flutter_demo/features/home/data/data_sources/github_data_remote_source.dart';
import 'package:flutter_demo/features/home/data/data_sources/github_data_remote_source_impl.dart';
import 'package:get/instance_manager.dart';

import '../data/repository/github_project_repository_impl.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GithubDataRemoteSourceImpl());
    Get.lazyPut(
        () => GithubProjectRepositoryImpl(Get.find<GithubDataRemoteSource>()));
    Get.lazyPut(() => HomeController(Get.find<GithubProjectRepositoryImpl>()));
  }
}
