import 'package:flutter_demo/features/home/bindings/home_bindings.dart';
import 'package:flutter_demo/features/home/views/home_screen.dart';
import 'package:flutter_demo/utils/routes/app_routes.dart';

import 'package:get/route_manager.dart';

final List<GetPage> pages = [
  GetPage(
    name: Routes.home,
    page: () => const HomeScreen(),
    binding: HomeBindings(),
  ),
];
