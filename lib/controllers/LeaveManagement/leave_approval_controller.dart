import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../model/leave_approvals_model.dart';

class LeaveApprovalController extends GetxController {
  var leaveApprovalsModelPendingList =
      List<LeaveApprovalsModel>.empty(growable: true).obs;
  var leaveApprovalsModelReporteeLeavesList =
      List<LeaveApprovalsModel>.empty(growable: true).obs;
  final selectedTabIndex = 0.obs;

  fetchPendingCards() {
    leaveApprovalsModelPendingList.clear();
    leaveApprovalsModelPendingList.add(LeaveApprovalsModel(
        name: "Naran Kumar",
        status: "Requested",
        reason: "Requesting Leave for person reason",
        year: 2023,
        empId: "LLP0075",
        startDate: "22-Dec-2023",
        endDate: "23-Dec-2023",
        noOfDays: 2,
        leaveType: "CL"));
    leaveApprovalsModelPendingList.add(LeaveApprovalsModel(
        name: "Shahul Hammed",
        status: "Approved",
        reason: "Requesting Leave for person reason",
        year: 2024,
        empId: "LLP0075",
        startDate: "17-Dec-2023",
        endDate: "19-Dec-2023",
        noOfDays: 3,
        leaveType: "CL"));
    leaveApprovalsModelPendingList.add(LeaveApprovalsModel(
        name: "Sakthivel",
        status: "Rejected",
        reason: "Requesting Leave for person reason",
        year: 2023,
        empId: "LLP0075",
        startDate: "07-Mar-2023",
        endDate: "08-Mar-2023",
        noOfDays: 2,
        leaveType: "EL"));
  }

  fetchReporteeLeaveCards() {
    leaveApprovalsModelReporteeLeavesList.clear();
    leaveApprovalsModelReporteeLeavesList.add(LeaveApprovalsModel(
        name: "Naran Kumar",
        status: "Requested",
        reason: "Requesting Leave for person reason",
        year: 2023,
        empId: "LLP0075",
        startDate: "22-Dec-2023",
        endDate: "23-Dec-2023",
        noOfDays: 2,
        leaveType: "CL"));
    leaveApprovalsModelReporteeLeavesList.add(LeaveApprovalsModel(
        name: "Shahul Hammed",
        status: "Requested",
        reason: "Requesting Leave for person reason",
        year: 2023,
        empId: "LLP0075",
        startDate: "17-Dec-2023",
        endDate: "19-Dec-2023",
        noOfDays: 3,
        leaveType: "CL"));
    leaveApprovalsModelReporteeLeavesList.add(LeaveApprovalsModel(
        name: "Sakthivel",
        status: "Requested",
        reason: "Requesting Leave for person reason",
        year: 2023,
        empId: "LLP0075",
        startDate: "07-Mar-2023",
        endDate: "08-Mar-2023",
        noOfDays: 2,
        leaveType: "CL"));
  }
}
