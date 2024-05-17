import 'package:get/instance_manager.dart';

import '../../features/home/data/data_sources/github_data_remote_source_impl.dart';

import '../../features/home/data/repository/github_project_repository_impl.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GithubDataRemoteSourceImpl(),
    );
    Get.lazyPut(
      () => GithubProjectRepositoryImpl(
        Get.find<GithubDataRemoteSourceImpl>(),
      ),
    );
  }
}
