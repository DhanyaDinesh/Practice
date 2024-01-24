import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LeaveManagementController extends GetxController{
  final name = "".obs;

  final TextEditingController employeeNameTEController=TextEditingController();
  final TextEditingController reportingManagerTEController=TextEditingController();
  final TextEditingController startDateTEController=TextEditingController();
  final TextEditingController endDateTEController=TextEditingController();
  final TextEditingController yearTEController = TextEditingController();
  final leaveType = "".obs;

}
