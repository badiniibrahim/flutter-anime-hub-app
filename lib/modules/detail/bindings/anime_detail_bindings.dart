import 'package:animehub/modules/detail/controller/anime_detail_controller.dart';
import 'package:get/get.dart';

class AnimeDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimeDetailController>(
      () => AnimeDetailController(),
    );
  }
}
