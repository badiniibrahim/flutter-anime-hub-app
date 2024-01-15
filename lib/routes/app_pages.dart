import 'package:animehub/modules/detail/bindings/anime_detail_bindings.dart';
import 'package:animehub/modules/detail/views/anime_view.dart';
import 'package:animehub/modules/home/bindings/home_bindings.dart';
import 'package:animehub/modules/home/views/home_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => const AnimeDetailView(),
      binding: AnimeDetailBinding(),
    ),
  ];
}
