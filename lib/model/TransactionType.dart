import 'dart:convert';

TransactionType transactionTypeFromJson(String str) => TransactionType.fromJson(json.decode(str));
String transactionTypeToJson(TransactionType data) => json.encode(data.toJson());
class TransactionType {
  TransactionType({
      String? moduleCode, 
      String? moduleName, 
      String? description, 
      bool? bloodRelationFlag,}){
    _moduleCode = moduleCode;
    _moduleName = moduleName;
    _description = description;
    _bloodRelationFlag = bloodRelationFlag;
}

  TransactionType.fromJson(dynamic json) {
    _moduleCode = json['moduleCode'];
    _moduleName = json['module_name'];
    _description = json['description'];
    _bloodRelationFlag = json['bloodRelationFlag'];
  }
  String? _moduleCode;
  String? _moduleName;
  String? _description;
  bool? _bloodRelationFlag;

  String? get moduleCode => _moduleCode;
  String? get moduleName => _moduleName;
  String? get description => _description;
  bool? get bloodRelationFlag => _bloodRelationFlag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['moduleCode'] = _moduleCode;
    map['module_name'] = _moduleName;
    map['description'] = _description;
    map['bloodRelationFlag'] = _bloodRelationFlag;
    return map;
  }

}