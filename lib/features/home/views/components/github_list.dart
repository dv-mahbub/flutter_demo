import 'package:flutter/material.dart';
import 'package:flutter_demo/features/home/views/details_view.dart';
import 'package:flutter_demo/shared/widgets/data_state_view.dart';
import 'package:flutter_demo/shared/widgets/loading_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

import '../../controllers/home_controller.dart';

class GithubListWidget extends StatefulWidget {
  const GithubListWidget({super.key});

  @override
  State<GithubListWidget> createState() => _GithubListWidgetState();
}

class _GithubListWidgetState extends State<GithubListWidget> {
  final _controller = Get.find<HomeController>();
  ScrollController scrollController = ScrollController();
  final Debouncer _debouncer =
      Debouncer(delay: const Duration(milliseconds: 500));
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        _debouncer.call(() {
          if (!_controller.isFullyLoaded.value) {
            _controller.fetchGithubFlutterProjects();
          }
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DataStateViewWidget(
        success: ListView.builder(
          controller: scrollController,
          padding: const EdgeInsets.all(10),
          itemCount: _controller.githubProjectList.length,
          itemBuilder: (_, index) {
            final item = _controller.githubProjectList[index];

            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(GithubDetailsScreen(
                      item: item,
                    ));
                  },
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Column(
                          children: [
                            Text(item.name ?? "N/A"),
                            // Text(item?.),
                            Text("owner name: ${item.owner?.login}"),
                            Text("Star: ${item.stargazersCount}"),
                          ],
                        ),
                      ),
                      if (_controller.githubProjectList.length - 1 == index)
                        const LoadingWidget(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        viewState: _controller.viewState.value,
        errorMessage: _controller.errorMsg(),
      );
    });
  }
}
