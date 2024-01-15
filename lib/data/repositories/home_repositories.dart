import 'package:animehub/data/models/anime.dart';
import 'package:animehub/data/provider/home_provider.dart';
import 'package:animehub/data/repositories/i_repository.dart';
import 'package:dio/dio.dart';

class HomeRepository extends IRepository<Response> {
  @override
  HomeProvider get provider => HomeProvider();

  Future<List<Anime>> fetchAnime() async {
    final response = await provider.fetchAnime();
    var car = response.data as List;
    List<Anime> animeList = car.map((m) => Anime.fromJson(m)).toList();
    return animeList;
  }
}
