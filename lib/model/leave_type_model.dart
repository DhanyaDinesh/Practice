import 'dart:convert';

LeaveTypeModel leaveTypeModelFromJson(String str) => LeaveTypeModel.fromJson(json.decode(str));
String leaveTypeModelToJson(LeaveTypeModel data) => json.encode(data.toJson());
class LeaveTypeModel {
  LeaveTypeModel({
      String? id, 
      String? moduleName, 
      String? description,}){
    _id = id;
    _moduleName = moduleName;
    _description = description;
}

  LeaveTypeModel.fromJson(dynamic json) {
    _id = json['id'];
    _moduleName = json['module_name'];
    _description = json['description'];
  }
  String? _id;
  String? _moduleName;
  String? _description;

  String? get id => _id;
  String? get moduleName => _moduleName;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['module_name'] = _moduleName;
    map['description'] = _description;
    return map;
  }

}