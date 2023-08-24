import 'package:get/get.dart';

import '../modules/home/views/home_view.dart';
import '../modules/user_add/views/user_add_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: _Paths.USER_ADD,
      page: () => UserAddView(),
    ),
  ];
}
