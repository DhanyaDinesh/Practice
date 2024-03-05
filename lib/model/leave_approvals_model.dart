import 'dart:convert';

class LeaveApprovalsModel {
  LeaveApprovalsModel({
      String? name, 
      String? status, 
      String? reason, 
      int? year, 
      String? empId, 
      String? startDate, 
      String? endDate, 
      int? noOfDays, 
      String? leaveType,}){
    _name = name;
    _status = status;
    _reason = reason;
    _year = year;
    _empId = empId;
    _startDate = startDate;
    _endDate = endDate;
    _noOfDays = noOfDays;
    _leaveType = leaveType;
}

  LeaveApprovalsModel.fromJson(dynamic json) {
    _name = json['name'];
    _status = json['status'];
    _reason = json['reason'];
    _year = json['year'];
    _empId = json['empId'];
    _startDate = json['startDate'];
    _endDate = json['endDate'];
    _noOfDays = json['noOfDays'];
    _leaveType = json['leaveType'];
  }
  String? _name;
  String? _status;
  String? _reason;
  int? _year;
  String? _empId;
  String? _startDate;
  String? _endDate;
  int? _noOfDays;
  String? _leaveType;

  String? get name => _name;
  String? get status => _status;
  String? get reason => _reason;
  int? get year => _year;
  String? get empId => _empId;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  int? get noOfDays => _noOfDays;
  String? get leaveType => _leaveType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['status'] = _status;
    map['reason'] = _reason;
    map['year'] = _year;
    map['empId'] = _empId;
    map['startDate'] = _startDate;
    map['endDate'] = _endDate;
    map['noOfDays'] = _noOfDays;
    map['leaveType'] = _leaveType;
    return map;
  }

}