import 'package:animehub/data/models/anime_detail.dart';
import 'package:animehub/data/provider/anime_detail_provider.dart';
import 'package:animehub/data/repositories/i_repository.dart';
import 'package:dio/dio.dart';

class AnimeDetailRepository extends IRepository<Response> {
  @override
  AnimeDetailProvider get provider => AnimeDetailProvider();

  Future<AnimeDetail> getAnimeDetail(int movieId) async {
    final response = await provider.getAnimeDetail(movieId);
    AnimeDetail animeDetail = AnimeDetail.fromJson(response.data);
    return animeDetail;
  }
}
