class AmimeModels {
  ResultsData? results;

  AmimeModels({this.results});

  AmimeModels.fromJson(Map<String, dynamic> json) {
    // if (json['results'] != null) {
    //   results = ResultsData;
    //   json['results'].forEach((v) {
    //     results!.add(new ResultsData.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    // if (this.results != null) {
    //   data['results'] = this.results!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class ResultsData {
  String? animeName;
  String? url;

  ResultsData({this.animeName, this.url});

  ResultsData.fromJson(Map<String, dynamic> json) {
    animeName = json['anime_name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['anime_name'] = this.animeName;
    data['url'] = this.url;
    return data;
  }
}
