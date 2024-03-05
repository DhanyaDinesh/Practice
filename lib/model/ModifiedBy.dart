import 'dart:convert';

ModifiedBy modifiedByFromJson(String str) => ModifiedBy.fromJson(json.decode(str));
String modifiedByToJson(ModifiedBy data) => json.encode(data.toJson());
class ModifiedBy {
  ModifiedBy({
      String? firstName, 
      dynamic employeeId,}){
    _firstName = firstName;
    _employeeId = employeeId;
}

  ModifiedBy.fromJson(dynamic json) {
    _firstName = json['first_name'];
    _employeeId = json['employeeId'];
  }
  String? _firstName;
  dynamic _employeeId;

  String? get firstName => _firstName;
  dynamic get employeeId => _employeeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    map['employeeId'] = _employeeId;
    return map;
  }

}