import 'package:animehub/core/api/i_controller.dart';
import 'package:animehub/data/repositories/home_repositories.dart';
import 'package:animehub/modules/home/state.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController with IController {
  final HomeRepository _repository = HomeRepository();
  final HomeState state = HomeState();

  Future<void> fetchAnime([String? name]) async {
    actionPerform(
      action: () async {
        state.isLoading = true;
        final response = await _repository.fetchAnime();
        state.animeList = response;
      },
      callback: () {
        state.isLoading = false;
      },
    );
  }
}
