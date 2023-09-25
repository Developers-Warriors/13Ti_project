import 'package:abstracts/core/network/_network.dart';
import 'package:abstracts/feature/testings_api/data/_data.dart';

class RickRepo {
  RickRepo({required this.dio});
  final Dio dio;

  Future<RickAndMorty> getRickAndMorty() async {
    final response = await dio.get('character/');
    final RickAndMorty result = RickAndMorty.fromJson(response.data);
    return result;
  }

  Future<List<AmimeModels>> getAnime({required int amount}) async {
    final response = await dio.get('https://nekos.best/api/v2/hug?amount',
        queryParameters: {'amount': amount});
    final List<AmimeModels> result = [];
    for (var item in response.data as List) {
      try {
        result.add(AmimeModels.fromJson(item));
      } catch (e) {}
    }
    return result;
    // return AnimeModels.fromJson(response.data);
  }
}
