import 'package:animehub/core/api/i_controller.dart';
import 'package:animehub/data/repositories/anime_detail_repository.dart';
import 'package:animehub/modules/detail/state.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimeDetailController extends GetxController with IController {
  final AnimeDetailState state = AnimeDetailState();
  final AnimeDetailRepository _repository = AnimeDetailRepository();

  Future<void> getAnimeDetail(int animeId) async {
    actionPerform(
      action: () async {
        state.isLoading = true;
        final response = await _repository.getAnimeDetail(animeId);
        state.animeDetail = response;
      },
      callback: () {
        state.isLoading = false;
      },
    );
  }

  Future<void> launchYoutubeVideo(String url) async {
    if (url.isNotEmpty) {
      if (await canLaunch(url)) {
        final bool _nativeAppLaunchSucceeded = await launch(
          url,
          forceSafariVC: false,
          universalLinksOnly: true,
        );
        if (!_nativeAppLaunchSucceeded) {
          await launch(url, forceSafariVC: true);
        }
      }
    }
  }
}
