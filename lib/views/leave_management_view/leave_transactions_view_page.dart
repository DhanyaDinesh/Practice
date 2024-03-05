import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/controllers/LeaveManagement/leave_transaction_controller.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/utils/typeDefs.dart';
import 'package:untitled2/views/Leave_Management_view/leave_management_view_page.dart';

class LeaveTransactionView extends GetView<LeaveTransactionController> {
  LeaveTransactionView({super.key}) {
    Get.put(LeaveTransactionController());
    controller.fetchCards();
  }

  statusColor(String leaveStatus) {
    if (leaveStatus == "Requested") {
      return Colors.orange;
    }
    if (leaveStatus == "Approved") {
      return Colors.blue;
    }
    if (leaveStatus == "Rejected") {
      return Colors.red;
    }
    if (leaveStatus == "Recorded") {
      return Colors.grey;
    }
    return null;
  }

  // final MyFunction myFunction = (){};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        backgroundColor: Colors.blueAccent,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Get.to(() => LeaveManagementViewPage());
        },
      ),
      appBar: AppBar(
        title: Text(
          "Leave Transactions",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: controller.leaveTransactionsModelList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller
                                .leaveTransactionsModelList[index].leaveType ??
                            "-",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        controller.leaveTransactionsModelList[index]
                                .leaveStatus ??
                            "-",
                        style: TextStyle(
                            color: statusColor(controller
                                    .leaveTransactionsModelList[index].leaveStatus ?? "-",
                                    )),
                        // textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Reason",
                        style: TextStyle(color: Colors.black26),
                      ),
                      Text(
                        controller.leaveTransactionsModelList[index].reason ??
                            "-",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Start Date",
                            style: TextStyle(color: Colors.black26),
                          ),
                          Text(
                            controller.leaveTransactionsModelList[index]
                                    .startDate ??
                                "-",
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "End Date",
                            style: TextStyle(color: Colors.black26),
                          ),
                          Text(controller
                                  .leaveTransactionsModelList[index].endDate ??
                              "-"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "No of Leaves",
                        style: TextStyle(color: Colors.black26),
                      ),
                      Text((controller.leaveTransactionsModelList[index]
                                  .noOfLeaves ??
                              "-")
                          .toString()),
                    ],
                  ),
                ],
              ),

            ),
          );
        },
      ),
    );
  }
}
