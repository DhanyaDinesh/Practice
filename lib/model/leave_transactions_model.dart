import 'dart:convert';

class LeaveTransactionsModel {
  LeaveTransactionsModel({
      String? leaveType, 
      String? leaveStatus, 
      String? reason, 
      String? startDate, 
      String? endDate, 
      int? noOfLeaves,}){
    _leaveType = leaveType;
    _leaveStatus = leaveStatus;
    _reason = reason;
    _startDate = startDate;
    _endDate = endDate;
    _noOfLeaves = noOfLeaves;
}

  LeaveTransactionsModel.fromJson(dynamic json) {
    _leaveType = json['leaveType'];
    _leaveStatus = json['leaveStatus'];
    _reason = json['reason'];
    _startDate = json['startDate'];
    _endDate = json['endDate'];
    _noOfLeaves = json['noOfLeaves'];
  }
  String? _leaveType;
  String? _leaveStatus;
  String? _reason;
  String? _startDate;
  String? _endDate;
  int? _noOfLeaves;

  String? get leaveType => _leaveType;
  String? get leaveStatus => _leaveStatus;
  String? get reason => _reason;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  int? get noOfLeaves => _noOfLeaves;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['leaveType'] = _leaveType;
    map['leaveStatus'] = _leaveStatus;
    map['reason'] = _reason;
    map['startDate'] = _startDate;
    map['endDate'] = _endDate;
    map['noOfLeaves'] = _noOfLeaves;
    return map;
  }

}