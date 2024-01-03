class BannerModel {
  List<Result>? result;

  BannerModel({this.result});

  BannerModel.fromJson(Map<String, dynamic> json) {
    if(json["result"] is List) {
      result = json["result"] == null ? null : (json["result"] as List).map((e) => Result.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(result != null) {
      _data["result"] = result?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Result {
  String? id;
  String? title;
  String? status;
  String? pic;
  String? url;
  int? position;

  Result({this.id, this.title, this.status, this.pic, this.url, this.position});

  Result.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["pic"] is String) {
      pic = json["pic"];
    }
    if(json["url"] is String) {
      url = json["url"];
    }
    if(json["position"] is int) {
      position = json["position"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["title"] = title;
    _data["status"] = status;
    _data["pic"] = pic;
    _data["url"] = url;
    _data["position"] = position;
    return _data;
  }
}

