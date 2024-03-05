import 'package:untitled2/constants/app_texts.dart';

class ApiUrls {
  ApiUrls._();

  static const String _devBaseURL =
      "https://devdashboard.lightninglogistics.in/leave-management-service/api/v1";

  static const String _qaBaseURL = "";

  static const String _prodBaseURL = "";

  static const String baseURL = AppTexts.env == "prod"
      ? _prodBaseURL
      : AppTexts.env == "qa"
          ? _qaBaseURL
          : _devBaseURL;

  // endpoints
  static const String applyLeave = "https://devdashboard.lightninglogistics.in/leave-management-service/api/v1/leaveDetails/applyLeave";


  static const String leaveTypeDropDowns = "https://devdashboard.lightninglogistics.in/leave-management-service/api/v1/leaveType";
  static const String leaveTransactions = "https://devdashboard.lightninglogistics.in/leave-management-service/api/v1/getLeaveTransactionOnView";
}
