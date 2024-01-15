import 'package:animehub/core/api/api_provider.dart';
import 'package:animehub/data/provider/i_provider.dart';
import 'package:dio/dio.dart';

class HomeProvider extends IProvider<Response> {
  @override
  String get endpoint => "?pages=1&limit=10&order=popularity";

  Future<Response> fetchAnime() async {
    return await ApiProvider.instance.get(endpoint: endpoint);
  }
}
