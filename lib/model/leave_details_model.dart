import 'dart:convert';

class LeaveDetailsModel {
  LeaveDetailsModel({
    String? date,
    String? status,
    String? transactionType,
    int? noOfLeaves,
    String? startDate,
    String? endDate,
    String? createdBy,
    String? createdAt,
    String? modifiedBy,
    String? modifiedAt,
    String? reason,
    String? leaveType,}) {
    _date = date;
    _status = status;
    _transactionType = transactionType;
    _noOfLeaves = noOfLeaves;
    _startDate = startDate;
    _endDate = endDate;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _modifiedBy = modifiedBy;
    _modifiedAt = modifiedAt;
    _reason = reason;
    _leaveType = leaveType;
  }

  LeaveDetailsModel.fromJson(dynamic json) {
    _date = json['date'];
    _status = json['status'];
    _transactionType = json['transactionType'];
    _noOfLeaves = json['noOfLeaves'];
    _startDate = json['startDate'];
    _endDate = json['endDate'];
    _createdBy = json['createdBy'];
    _createdAt = json['createdAt'];
    _modifiedBy = json['modifiedBy'];
    _modifiedAt = json['modifiedAt'];
    _reason = json['reason'];
    _leaveType = json['leaveType'];
  }

  String? _date;
  String? _status;
  String? _transactionType;
  int? _noOfLeaves;
  String? _startDate;
  String? _endDate;
  String? _createdBy;
  String? _createdAt;
  String? _modifiedBy;
  String? _modifiedAt;
  String? _reason;
  String? _leaveType;

  String? get date => _date;

  String? get status => _status;

  String? get transactionType => _transactionType;

  int? get noOfLeaves => _noOfLeaves;

  String? get startDate => _startDate;

  String? get endDate => _endDate;

  String? get createdBy => _createdBy;

  String? get createdAt => _createdAt;

  String? get modifiedBy => _modifiedBy;

  String? get modifiedAt => _modifiedAt;

  String? get reason => _reason;

  String? get leaveType => _leaveType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['status'] = _status;
    map['transactionType'] = _transactionType;
    map['noOfLeaves'] = _noOfLeaves;
    map['startDate'] = _startDate;
    map['endDate'] = _endDate;
    map['createdBy'] = _createdBy;
    map['createdAt'] = _createdAt;
    map['modifiedBy'] = _modifiedBy;
    map['modifiedAt'] = _modifiedAt;
    map['reason'] = _reason;
    map['leaveType'] = _leaveType;
    return map;
  }
}
