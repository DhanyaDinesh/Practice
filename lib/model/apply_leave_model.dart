import 'dart:convert';

class ApplyLeaveModel {
  ApplyLeaveModel({
      String? leaveType, 
      String? startDate, 
      String? endDate, 
      int? noOfLeaves, 
      int? year, 
      String? leaveReason, 
      String? designation, 
      String? transactionType, 
      String? leaveStatus, 
      String? action,}){
    _leaveType = leaveType;
    _startDate = startDate;
    _endDate = endDate;
    _noOfLeaves = noOfLeaves;
    _year = year;
    _leaveReason = leaveReason;
    _designation = designation;
    _transactionType = transactionType;
    _leaveStatus = leaveStatus;
    _action = action;
}

  ApplyLeaveModel.fromJson(dynamic json) {
    _leaveType = json['leaveType'];
    _startDate = json['startDate'];
    _endDate = json['endDate'];
    _noOfLeaves = json['noOfLeaves'];
    _year = json['year'];
    _leaveReason = json['leaveReason'];
    _designation = json['designation'];
    _transactionType = json['transactionType'];
    _leaveStatus = json['leaveStatus'];
    _action = json['action'];
  }
  String? _leaveType;
  String? _startDate;
  String? _endDate;
  int? _noOfLeaves;
  int? _year;
  String? _leaveReason;
  String? _designation;
  String? _transactionType;
  String? _leaveStatus;
  String? _action;

  String? get leaveType => _leaveType;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  int? get noOfLeaves => _noOfLeaves;
  int? get year => _year;
  String? get leaveReason => _leaveReason;
  String? get designation => _designation;
  String? get transactionType => _transactionType;
  String? get leaveStatus => _leaveStatus;
  String? get action => _action;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['leaveType'] = _leaveType;
    map['startDate'] = _startDate;
    map['endDate'] = _endDate;
    map['noOfLeaves'] = _noOfLeaves;
    map['year'] = _year;
    map['leaveReason'] = _leaveReason;
    map['designation'] = _designation;
    map['transactionType'] = _transactionType;
    map['leaveStatus'] = _leaveStatus;
    map['action'] = _action;
    return map;
  }

}