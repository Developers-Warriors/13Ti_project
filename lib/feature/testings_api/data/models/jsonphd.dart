class JsonPHDModels {
  int? userId;
  int? id;
  String? title;
  String? body;

  JsonPHDModels({this.userId, this.id, this.title, this.body});

  JsonPHDModels.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        body = json['body'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }

  static List<JsonPHDModels> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => JsonPHDModels.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> listToJson(List<JsonPHDModels> modelsList) {
    return modelsList.map((model) => model.toJson()).toList();
  }
}
