import 'dart:convert';


///convert和FlutterJsonBeanFactory结合解析
class BaseEntity<T> {
  late List<T>? data;
  late int? code;
  late String? message;

  BaseEntity({this.data, this.code, this.message});

  // map类型数据
  factory BaseEntity.fromMap(Map<String, dynamic> body) {
    return BaseEntity<T>(
      code: 0,
      message: "message",
      data: body['result'].cast<T>(),
    );
  }





  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data;
    }
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}
