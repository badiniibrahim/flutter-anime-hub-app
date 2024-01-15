import 'package:animehub/core/api/api_provider.dart';
import 'package:animehub/data/provider/i_provider.dart';
import 'package:dio/dio.dart';

class AnimeDetailProvider extends IProvider<Response> {
  @override
  String get endpoint => "/";

  Future<Response> getAnimeDetail(int animeId) async {
    return await ApiProvider.instance.get(
      endpoint: "$endpoint$animeId",
    );
  }
}
