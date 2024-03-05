import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/model/leave_approvals_model.dart';

import '../../controllers/LeaveManagement/leave_approval_controller.dart';

class LeaveApprovalViewPage extends StatefulWidget {
  const LeaveApprovalViewPage({super.key});

  @override
  State<LeaveApprovalViewPage> createState() => _LeaveApprovalViewPageState();
}

class _LeaveApprovalViewPageState extends State<LeaveApprovalViewPage>
    with SingleTickerProviderStateMixin {
  late LeaveApprovalController controller;
  late TabController tabController;
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Pending'),
    Tab(text: 'My Reportee Leaves'),
  ];

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

  @override
  void initState() {
    super.initState();
    controller = Get.put(LeaveApprovalController());
    controller.fetchPendingCards();
    controller.fetchReporteeLeaveCards();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      log(tabController.index.toString());
      controller.selectedTabIndex.value = tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Leave Approvals"),
          bottom: TabBar(
            tabs: myTabs,
            // controller: tabController,
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return _myCard(
                      controller.leaveApprovalsModelPendingList[index], 0);
                },
                itemCount: controller.leaveApprovalsModelPendingList.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                    child: TextField(
                      decoration:
                          InputDecoration(hintText: "Search Emp Id, Name"),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return _myCard(
                            controller
                                .leaveApprovalsModelReporteeLeavesList[index],
                            1);
                      },
                      itemCount: controller
                          .leaveApprovalsModelReporteeLeavesList.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _myCard(LeaveApprovalsModel leaveApprovalsModel, int tabIndex) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  leaveApprovalsModel.name ?? "-",
                  style: const TextStyle(
                    color: Colors.blue,
                  ),
                ),
                Text(
                  leaveApprovalsModel.status ?? "-",
                  style: TextStyle(
                    color: statusColor(leaveApprovalsModel.status ?? "-"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Reason",
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 13,
                  ),
                ),
                Text(
                  leaveApprovalsModel.reason ?? "-",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "year",
                      style: TextStyle(
                        color: Colors.black26,
                      ),
                    ),
                    Text(
                      (leaveApprovalsModel.year ?? "-").toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "Emp Id",
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      leaveApprovalsModel.empId ?? "-",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      "Start date",
                      style: TextStyle(
                        color: Colors.black26,
                      ),
                    ),
                    Text(
                      leaveApprovalsModel.startDate ?? "-",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "End Date",
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      leaveApprovalsModel.endDate ?? "-",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "No of Leaves",
                      style: TextStyle(
                        color: Colors.black26,
                      ),
                    ),
                    Text(
                      (leaveApprovalsModel.noOfDays ?? "=").toString(),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "Leave Type",
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      leaveApprovalsModel.leaveType ?? "-",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Visibility(
              visible: tabIndex == 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.grey)),
                    onPressed: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35),
                              )),
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              height: 400,
                              width: 400,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 35,
                                    ),
                                    // Divider(),
                                    Container(
                                      height: 3,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(15),
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text("Reject Leave ",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                          "*",
                                          style: TextStyle(color: Colors.red),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        maxLines: 5,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          hintText: "Reason for Rejection",
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.grey)),
                                          onPressed: () {},
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.blue)),
                                          onPressed: () {},
                                          child: Text(
                                            "Reject",
                                            style: TextStyle(
                                                color: Colors.white),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: const Text(
                      "Reject",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.blue)),
                    onPressed: () {},
                    child: const Text(
                      "Approve",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
