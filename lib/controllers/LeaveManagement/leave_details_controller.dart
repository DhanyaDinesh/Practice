import 'package:get/get.dart';
import 'package:untitled2/model/leave_details_model.dart';

class LeaveDetailsController extends GetxController {
  var leaveDetailsModel = LeaveDetailsModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    leaveDetailsModel.value = LeaveDetailsModel(
        date: "13-Dec-2023",
        status: "Requested",
        transactionType: "Debit",
        noOfLeaves: 5,
        leaveType: "EL",
        startDate: "20-Dec-2023",
        endDate: "23-Dec-2023",
        createdBy: "Rahul Ranjan",
        createdAt: "30-Dec-2023",
        modifiedBy: "Dhanya",
        modifiedAt: "01-01-2024",
        reason: "personal leave");
  }
}
