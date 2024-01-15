import 'package:animehub/data/models/anime_detail.dart';
import 'package:get/get.dart';

class AnimeDetailState {
  // isLoading
  final RxBool _isLoading = RxBool(false);
  set isLoading(value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  final Rx<AnimeDetail> _animeDetail = AnimeDetail().obs;
  set animeDetail(value) => _animeDetail.value = value;
  AnimeDetail get animeDetail => _animeDetail.value;
  Rx<AnimeDetail> get rxAnimeDetail => _animeDetail;
}
