
class CategoryRightModel {
  List<CategoryRightItemModel>? result;

  CategoryRightModel({this.result});

  CategoryRightModel.fromJson(Map<String, dynamic> json) {
    if(json["result"] is List) {
      result = json["result"] == null ? null : (json["result"] as List).map((e) => CategoryRightItemModel.fromJson(e)).toList();
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

class CategoryRightItemModel {
  String? id;
  String? title;
  int? status;
  String? pic;
  String? pid;
  int? sort;
  int? goProduct;
  String? productId;

  CategoryRightItemModel({this.id, this.title, this.status, this.pic, this.pid, this.sort, this.goProduct, this.productId});

  CategoryRightItemModel.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["status"] is int) {
      status = json["status"];
    }
    if(json["pic"] is String) {
      pic = json["pic"];
    }
    if(json["pid"] is String) {
      pid = json["pid"];
    }
    if(json["sort"] is int) {
      sort = json["sort"];
    }
    if(json["go_product"] is int) {
      goProduct = json["go_product"];
    }
    if(json["product_id"] is String) {
      productId = json["product_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["title"] = title;
    _data["status"] = status;
    _data["pic"] = pic;
    _data["pid"] = pid;
    _data["sort"] = sort;
    _data["go_product"] = goProduct;
    _data["product_id"] = productId;
    return _data;
  }
}