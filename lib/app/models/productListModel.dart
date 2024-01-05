
class ProductListModel {
  List<ProductListItemModel>? result;

  ProductListModel({this.result});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    if(json["result"] is List) {
      result = json["result"] == null ? null : (json["result"] as List).map((e) => ProductListItemModel.fromJson(e)).toList();
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

class ProductListItemModel {
  String? id;
  String? title;
  String? cid;
  int? price;
  String? pic;
  String? subTitle;
  String? sPic;

  ProductListItemModel({this.id, this.title, this.cid, this.price, this.pic, this.subTitle, this.sPic});

  ProductListItemModel.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["cid"] is String) {
      cid = json["cid"];
    }
    if(json["price"] is int) {
      price = json["price"];
    }
    if(json["pic"] is String) {
      pic = json["pic"];
    }
    if(json["sub_title"] is String) {
      subTitle = json["sub_title"];
    }
    if(json["s_pic"] is String) {
      sPic = json["s_pic"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["title"] = title;
    _data["cid"] = cid;
    _data["price"] = price;
    _data["pic"] = pic;
    _data["sub_title"] = subTitle;
    _data["s_pic"] = sPic;

    return _data;
  }


}



