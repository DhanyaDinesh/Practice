import 'dart:developer';

import 'Leave_type_model.dart';

class LeaveTypeDropDownModel {
  List<LeaveTypeModel>? data;

  //LeaveTypeDropDownModel(this.data);

  LeaveTypeDropDownModel.fromJson(dynamic json) {
    data = [];
    // log("json ${json}");
    if (json != null) {
      json.forEach((d) {
        log("map $d");
        data?.add(LeaveTypeModel.fromJson(d));
      });
    }
    log("data from model $data");
  }
}
