import 'package:abstracts/core/network/_network.dart';
import 'package:abstracts/feature/_feature.dart';

class JsonPHDRepo {
  JsonPHDRepo({required this.dio});
  final Dio dio;

  Future<JsonPHDModels> jSonPHD() async {
    final response = await dio.get(Endpoints.jsonPHD);
    final JsonPHDModels result = JsonPHDModels.fromJson(response.data);
    return result;
  }

  Future<List<JsonPHDModels>> fetchPost() async {
    try {
      Response response = await dio.get(Endpoints.jsonPHD);
      List<dynamic> postMaps = response.data;
      return postMaps
          .map(
            (postMap) => JsonPHDModels.fromJson(postMap),
          )
          .toList();
      // log(response.data);
    } catch (e) {
      throw e;
    }
  }
}
