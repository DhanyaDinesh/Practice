import 'LeaveType.dart';
import 'TransactionType.dart';
import 'LeaveStatus.dart';
import 'ModifiedBy.dart';
import 'CreatedBy.dart';
import 'dart:convert';

LeaveTransactions leaveTransactionsFromJson(String str) => LeaveTransactions.fromJson(json.decode(str));
String leaveTransactionsToJson(LeaveTransactions data) => json.encode(data.toJson());
class LeaveTransactions {
  LeaveTransactions({
      LeaveType? leaveType, 
      TransactionType? transactionType, 
      LeaveStatus? leaveStatus, 
      ModifiedBy? modifiedBy, 
      CreatedBy? createdBy, 
      int? noOfLeaves, 
      String? startDate, 
      String? endDate, 
      int? createdAt, 
      int? modifiedAt, 
      String? leaveReason,}){
    _leaveType = leaveType;
    _transactionType = transactionType;
    _leaveStatus = leaveStatus;
    _modifiedBy = modifiedBy;
    _createdBy = createdBy;
    _noOfLeaves = noOfLeaves;
    _startDate = startDate;
    _endDate = endDate;
    _createdAt = createdAt;
    _modifiedAt = modifiedAt;
    _leaveReason = leaveReason;
}

  LeaveTransactions.fromJson(dynamic json) {
    _leaveType = json['leaveType'] != null ? LeaveType.fromJson(json['leaveType']) : null;
    _transactionType = json['transactionType'] != null ? TransactionType.fromJson(json['transactionType']) : null;
    _leaveStatus = json['leaveStatus'] != null ? LeaveStatus.fromJson(json['leaveStatus']) : null;
    _modifiedBy = json['modifiedBy'] != null ? ModifiedBy.fromJson(json['modifiedBy']) : null;
    _createdBy = json['createdBy'] != null ? CreatedBy.fromJson(json['createdBy']) : null;
    _noOfLeaves = json['noOfLeaves'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _createdAt = json['createdAt'];
    _modifiedAt = json['modifiedAt'];
    _leaveReason = json['leaveReason'];
  }
  LeaveType? _leaveType;
  TransactionType? _transactionType;
  LeaveStatus? _leaveStatus;
  ModifiedBy? _modifiedBy;
  CreatedBy? _createdBy;
  int? _noOfLeaves;
  String? _startDate;
  String? _endDate;
  int? _createdAt;
  int? _modifiedAt;
  String? _leaveReason;

  LeaveType? get leaveType => _leaveType;
  TransactionType? get transactionType => _transactionType;
  LeaveStatus? get leaveStatus => _leaveStatus;
  ModifiedBy? get modifiedBy => _modifiedBy;
  CreatedBy? get createdBy => _createdBy;
  int? get noOfLeaves => _noOfLeaves;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  int? get createdAt => _createdAt;
  int? get modifiedAt => _modifiedAt;
  String? get leaveReason => _leaveReason;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_leaveType != null) {
      map['leaveType'] = _leaveType?.toJson();
    }
    if (_transactionType != null) {
      map['transactionType'] = _transactionType?.toJson();
    }
    if (_leaveStatus != null) {
      map['leaveStatus'] = _leaveStatus?.toJson();
    }
    if (_modifiedBy != null) {
      map['modifiedBy'] = _modifiedBy?.toJson();
    }
    if (_createdBy != null) {
      map['createdBy'] = _createdBy?.toJson();
    }
    map['noOfLeaves'] = _noOfLeaves;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['createdAt'] = _createdAt;
    map['modifiedAt'] = _modifiedAt;
    map['leaveReason'] = _leaveReason;
    return map;
  }

}