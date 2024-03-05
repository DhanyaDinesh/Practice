import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:untitled2/constants/api_urls.dart';
import 'package:untitled2/model/Apply_leave_model.dart';

import '../model/Leave_transactions.dart';
import '../model/leave_type_dropdown_model.dart';

class ApiService extends GetConnect {
  Future<String> postApplyLeave(ApplyLeaveModel applyLeaveModel) async {
    var response =
        await post(ApiUrls.applyLeave, applyLeaveModel.toJson(), headers: {
      "Authorization":
          "llBearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjA0OCwibW9iaWxlIjoiODk1MTIwNzUwNCIsIm5hbWUiOiJEaGFueWEgRCIsImxvZ2luIjoiZGhhbnlhZCIsInRpdGxlIjoiVGVzdCBFbmdpbmVlciAtIExMUDAwNzkiLCJmaXJzdG5hbWUiOiJEaGFueWEiLCJlbWFpbF93b3JrIjoiZGhhbnlhZEBlbnRvby5jb20iLCJyb2xlcyI6W3siaWQiOjIwMDUsInJvbGUiOiJEYXNoYm9hcmQgTWVtYmVyc2hpcCJ9LHsiaWQiOjIwMDMsInJvbGUiOiJEYXNoYm9hcmQgSVQgU3VwcG9ydCJ9XSwiaWF0IjoxNzA5NTI3OTA2LCJleHAiOjE3MDk3ODcxMDZ9.2Q5nEiyGsiEobWuQedJ2qRfo8SbW1BzHAYuI7MyeHCM",
      "Content-Type": "application/json"
    });
    var body = response.body;
    log("body -> $body");
    if (body != null) {
      var success =
          body["success"]; // body["data"], body["statusCode"], body["msg"]
      if (success != null && success) {
        return Future(
            () => ""); // errorMsg -> isEmpty = Success, isNotEmpty = Failure
      }
    }
    // if (response.statusCode == HttpStatus.ok)
    return Future(() => "Something went wrong");
  }

  Future<LeaveTypeDropDownModel?> getLeaveTypeDropDowns() async {
    var response = await get(ApiUrls.leaveTypeDropDowns, headers: {
      "Authorization":
          "llBearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjA0OCwibW9iaWxlIjoiODk1MTIwNzUwNCIsIm5hbWUiOiJEaGFueWEgRCIsImxvZ2luIjoiZGhhbnlhZCIsInRpdGxlIjoiVGVzdCBFbmdpbmVlciAtIExMUDAwNzkiLCJmaXJzdG5hbWUiOiJEaGFueWEiLCJlbWFpbF93b3JrIjoiZGhhbnlhZEBlbnRvby5jb20iLCJyb2xlcyI6W3siaWQiOjIwMDUsInJvbGUiOiJEYXNoYm9hcmQgTWVtYmVyc2hpcCJ9LHsiaWQiOjIwMDMsInJvbGUiOiJEYXNoYm9hcmQgSVQgU3VwcG9ydCJ9XSwiaWF0IjoxNzA5NTI3OTA2LCJleHAiOjE3MDk3ODcxMDZ9.2Q5nEiyGsiEobWuQedJ2qRfo8SbW1BzHAYuI7MyeHCM",
      "Content-Type": "application/json"
    });
    var body = response.body;
    log("body -> $body");
    if(body !=null) {
      var data = body["data"];
      if(data != null) {

        return Future(() => LeaveTypeDropDownModel.fromJson(data));
      }

    }
    return Future(() => null);
    log(response.body.toString());
  }

  Future<LeaveTransactions?> getLeaveTransactions()async {
    var response = await get(ApiUrls.leaveTransactions, headers: {
    "Authorization":
    "llBearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTc5MCwibW9iaWxlIjoiOTk0MzYzNjM2MiIsIm5hbWUiOiJOYXJhbiBLdW1hciIsImxvZ2luIjoibmFyYW5rdW1hciIsInRpdGxlIjoiQ29uc3VsdGFudCIsImZpcnN0bmFtZSI6Ik5hcmFuIiwiZW1haWxfd29yayI6Im5hcmFuY0BtaWNlbGlvLmNvbSIsImlhdCI6MTcwOTU0OTE4MCwiZXhwIjoxNzA5ODA4MzgwfQ.sUhvNd55kWI9k9Gp_EhFa-n4ajfOgbHAZDFgaboIJA8", "Content-Type": "application/json"
    });
    var body = response.body;
    log("body -> $body");
    if(body !=null) {
      var data = body["data"];
      if(data != null) {

        return Future(() => leaveTransactionsFromJson(data));
      }

    }
  }
}


