import 'package:get/get.dart';
import 'package:untitled2/model/leave_transactions_model.dart';
import 'package:untitled2/services/api_service.dart';

import '../../model/Leave_transactions.dart';

class LeaveTransactionController extends GetxController {
  var leaveTransactionsModelList =
      List<LeaveTransactions>.empty(growable: true).obs;
   ApiService _apiService = ApiService();

  fetchCards(){
    _apiService.getLeaveTransactions().then((value){
      if (value != null) {

      }
    });
  }
  /*fetchCards() {
    leaveTransactionsModelList.clear();
    leaveTransactionsModelList.add(LeaveTransactionsModel(
        leaveType: "Debit-EL",
        leaveStatus: "Requested",
        reason: "requesting a leave",
        startDate: "05-01-2023",
        endDate: "10-01-2023",
        noOfLeaves: 6));
    leaveTransactionsModelList.add(LeaveTransactionsModel(
        leaveType: "Credit-El",
        leaveStatus: "Approved",
        reason: "leave request",
        startDate: "25-Dec-2023",
        endDate: "26-Dec-2023",
        noOfLeaves: 2));
    leaveTransactionsModelList.add(LeaveTransactionsModel(
        leaveType: "Debit-CL",
        leaveStatus: "Rejected",
        reason: "Applying leave",
        startDate: "01-Jan-2024",
        endDate: "03-Jan-2024",
        noOfLeaves: 3));
    leaveTransactionsModelList.add(LeaveTransactionsModel(
        leaveType: "Credit-CL",
        leaveStatus: "Recorded",
        reason: "personal reason",
        startDate: "04-Jan-2024",
        endDate: "07-Jan-2024",
        noOfLeaves: 4));
  }*/
}
