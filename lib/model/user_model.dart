class UserModel {
  List<UserModelItemList>? data;

  //json to class
  UserModel.fromJson(dynamic json) {
    if (json["data"] != null) {
      data?.clear();
      json['data']
          .forEach((value) => {data?.add(UserModelItemList.fromJson(value))});
    }
  }
}

class UserModelItemList {
  UserModelItemList({
    String? name,
    int? age,
  }) {
    _name = name;
    _age = age;
  }

  UserModelItemList.fromJson(dynamic json) {
    _name = json['name'];
    _age = json['age'];
  }

  String? _name;
  int? _age;

  String? get name => _name;

  int? get age => _age;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['age'] = _age;
    return map;
  }
}
