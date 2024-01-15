import 'package:animehub/data/models/anime.dart';
import 'package:get/get_rx/get_rx.dart';

class HomeState {
  final RxBool _isLoading = RxBool(true);
  set isLoading(value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  final RxList<Anime> _animeList = <Anime>[].obs;
  set animeList(value) => _animeList.value = value;
  List<Anime> get animeList => _animeList;
}
