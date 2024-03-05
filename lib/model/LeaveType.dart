import 'dart:convert';

LeaveType leaveTypeFromJson(String str) => LeaveType.fromJson(json.decode(str));
String leaveTypeToJson(LeaveType data) => json.encode(data.toJson());
class LeaveType {
  LeaveType({
      String? moduleName, 
      String? description, 
      bool? bloodRelationFlag,}){
    _moduleName = moduleName;
    _description = description;
    _bloodRelationFlag = bloodRelationFlag;
}

  LeaveType.fromJson(dynamic json) {
    _moduleName = json['module_name'];
    _description = json['description'];
    _bloodRelationFlag = json['bloodRelationFlag'];
  }
  String? _moduleName;
  String? _description;
  bool? _bloodRelationFlag;

  String? get moduleName => _moduleName;
  String? get description => _description;
  bool? get bloodRelationFlag => _bloodRelationFlag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['module_name'] = _moduleName;
    map['description'] = _description;
    map['bloodRelationFlag'] = _bloodRelationFlag;
    return map;
  }

}