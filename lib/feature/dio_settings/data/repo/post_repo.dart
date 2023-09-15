import 'package:abstracts/feature/dio_settings/data/api/api.dart';
import 'package:abstracts/feature/dio_settings/data/models/post_model.dart';
import 'package:dio/dio.dart';

class PostRepo {
  API api = API();

  Future<List<PostModel>> fetchPost() async {
    try {
      Response response = await api.SendRequest.get('/posts');
      List<dynamic> postMaps = response.data;
      return postMaps.map((postMap) => PostModel.fromJson(postMap)).toList();
      // log(response.data);
    }  catch (e) {
      throw e;
    }
  }
}
