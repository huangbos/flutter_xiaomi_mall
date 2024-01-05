
import 'dart:convert';

import 'package:flutter_xiaomi_mall/app/models/productListModel.dart';


///convert和FlutterJsonBeanFactory结合解析
class BaseEntity<T> {
  late T? data;
  late int? errorCode;
  late String? errorMsg;

  BaseEntity({ this.data,  this.errorCode ,  this.errorMsg});



 // map类型数据
  factory BaseEntity.fromMap(Map<String, dynamic> body) {
    return BaseEntity(
      errorCode:11,
      errorMsg: "message",
      data: body['result'].cast<ProductListItemModel>(),
    );
  }

    // json类型数据
  factory BaseEntity.fromString(String body) {
    final result = json.decode(body);

    return BaseEntity(
      errorCode: 11,
      errorMsg: "message",
      data: result['data'],
    );
  }
  

  BaseEntity.fromJson(Map<String, dynamic> jsonData) {
    if (jsonData['result'] != null && jsonData['result'] != 'null') {
      // data = JsonConvert.fromJsonAsT<T>(jsonData['data']);
      // data = json.decode(jsonData['result']);
      data = jsonData['result'].cast<ProductListItemModel>();

      


      print("data===$data");
      // errorCode = jsonData['errorCode'];
      // errorMsg = jsonData['errorMsg'];
      errorCode = 0;
      errorMsg = "1111111";
    }
  }




  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data;
    }
    data['errorCode'] = this.errorCode;
    data['errorMsg'] = this.errorMsg;
    return data;
  }
}
