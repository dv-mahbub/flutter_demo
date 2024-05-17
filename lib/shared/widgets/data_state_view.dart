import 'package:flutter/material.dart';
import 'package:flutter_demo/core/models/view_state.dart';
import 'package:flutter_demo/shared/widgets/error_widget.dart';

import 'loading_widget.dart';

class DataStateViewWidget extends StatelessWidget {
  final ViewState viewState;
  final Widget success;
  final String errorMessage;
  const DataStateViewWidget(
      {super.key,
      required this.errorMessage,
      required this.success,
      required this.viewState});

  @override
  Widget build(BuildContext context) {
    if (viewState == ViewState.loaded) {
      return success;
    } else if (viewState == ViewState.error) {
      return APPErrorWidget(
        message: errorMessage,
      );
    }
    return const LoadingWidget();
  }
}
