import 'package:abstracts/core/network/_network.dart';
import 'package:abstracts/feature/testings_api/data/_data.dart';

class AnimeRepo {
  final Dio dio;
  AnimeRepo({required this.dio});
  Future<AmimeModels> getAnime({required int amount}) async {
    final response = await dio.get('https://nekos.best/api/v2/hug?amount',
        queryParameters: {'amount': amount});
    return AmimeModels.fromJson(response.data);
  }
}
