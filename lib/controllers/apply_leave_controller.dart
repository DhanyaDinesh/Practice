import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/constants/app_texts.dart';
import 'package:untitled2/model/Apply_leave_model.dart';
import 'package:untitled2/model/Leave_type_model.dart';
import 'package:untitled2/services/api_service.dart';

class ApplyLeaveController extends GetxController {
  final name = "".obs;
  final TextEditingController employeeNameTEController =
      TextEditingController();
  final TextEditingController reportingManagerTEController =
      TextEditingController();
  final TextEditingController startDateTEController = TextEditingController();
  final TextEditingController endDateTEController = TextEditingController();
  final TextEditingController yearTEController = TextEditingController();
  final leaveType = "".obs;
  var leaveTypeValue = "";

  // final applyLeaveModel = ApplyLeaveModel();

  // final leaveTypeDropDownList = List<LeaveTypeModel>.empty(growable: true).obs;

  // final leaveTypeDropdownKeyAsValue = <String, String>{}.obs;
  // final leaveTypeDropdownKeyAsId = <String, String>{}.obs;
  final leaveTypeDropdownList = <String, String>{}.obs;

  final ApiService _apiService = ApiService();

  Future<String> postApplyLeave() {
    if (AppTexts.dataMode == "mock") {
      //{
      //     "leaveType": "EL",
      //     "startDate": "2024/03/01",
      //     "endDate": "2024/03/05",
      //     "noOfLeaves": 5,
      //     "year": 2024,
      //     "leaveReason": "Marriage",
      //     "designation": "Software Engineer",
      //     "transactionType": "Debited",
      //     "leaveStatus": "Requested",
      //     "action": "data check"
      // }
      var mockApplyLeaveModel = ApplyLeaveModel(
          leaveType: "EL",
          startDate: "2024/03/01",
          endDate: "2024/03/05",
          noOfLeaves: 5,
          year: 2024,
          leaveReason: "Marriage",
          designation: "Software Engineer",
          transactionType: "Debited",
          leaveStatus: "Requested",
          action: "data check");
      return _apiService.postApplyLeave(mockApplyLeaveModel);
    } else {
      var applyLeaveModel = ApplyLeaveModel(
          leaveType: leaveTypeValue,
          startDate: "2024/03/01",
          endDate: "2024/03/05",
          noOfLeaves: 5,
          year: 2024,
          leaveReason: "Marriage",
          designation: "Software Engineer",
          transactionType: "Debited",
          leaveStatus: "Requested",
          action: "data check");
      return _apiService.postApplyLeave(applyLeaveModel);
    }
  }

  fetchLeaveTypeDropDowns() {
    _apiService.getLeaveTypeDropDowns().then((value) {
      if (value != null) {
        var data = value.data;
        log(data.toString());
        if (data != null) {
          for (var d in data) {
            var id = d.id;
            var moduleName = d.moduleName;

            if (id != null && moduleName != null) {
              // leaveTypeDropdownKeyAsId[id] = moduleName;
              // leaveTypeDropdownKeyAsValue[moduleName] = id;
              leaveTypeDropdownList[moduleName] = id;
            }
          }
        }
      }
    });
  }
}
