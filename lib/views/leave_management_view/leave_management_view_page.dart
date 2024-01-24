import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/controllers/LeaveManagement/leave_management_controller.dart';

class LeaveManagementViewPage extends GetView<LeaveManagementController> {
  LeaveManagementViewPage({super.key}) {
    Get.put(LeaveManagementController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apply Leave"),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Employee Name",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  enabled: true,
                  controller: controller.employeeNameTEController,
                  decoration: InputDecoration(
                      hintText: "Enter Employee Name",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black26,
                            width: 1.0,
                          )),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black26,
                            width: 1.0,
                          ))),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Reporting Manager",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: controller.reportingManagerTEController,
                  decoration: InputDecoration(
                    hintText: "Enter Reporting Manager Name",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 1.0,
                        )),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 1.0,
                        )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Leave Type ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "*",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<String>(
                  value: controller.leaveType.value.isEmpty
                      ? null
                      : controller.leaveType.value,
                  items: ['EL', 'CL']
                      .map((label) =>
                      DropdownMenuItem(
                        child: Text(label.toString()),
                        value: label,
                      ))
                      .toList(),
                  hint: Text("Select Leave Type"),
                  onChanged: (value) {
                    if (value != null) {
                      controller.leaveType.value = value;
                    }
                  },
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black26,
                            width: 1.0,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black26,
                            width: 1.0,
                          )),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black26,
                            width: 1.0,
                          ))),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Leave Balance",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Leave Balance",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 1.0,
                        )),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.0,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Start Date ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "*",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () async {
                    var selectDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now(),
                    );
                    controller.startDateTEController.text =
                    "${selectDate?.day}/${selectDate?.month}/${selectDate
                        ?.year}";
                  },
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    controller: controller.startDateTEController,
                    enableInteractiveSelection: false,
                    autofocus: false,
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: "Select Start Date",
                      hintStyle: TextStyle(
                        color: Color(0xff606060),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 1,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 1,
                        ),
                      ),
                      suffixIcon: Icon(
                        Icons.date_range,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "End Date ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "*",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async {
                    var selectDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now(),
                    );
                    controller.endDateTEController.text =
                    "${selectDate?.day}/${selectDate?.month}/${selectDate
                        ?.year}";
                  },
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    controller: controller.startDateTEController,
                    enableInteractiveSelection: false,
                    autofocus: false,
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: "Select End Date",
                      hintStyle: TextStyle(
                        color: Color(0xff606060),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 1,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 1,
                        ),
                      ),
                      suffixIcon: Icon(
                        Icons.date_range,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "No of Leaves ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "*",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter no of leaves",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text("Year "),
                    Text(
                      "*",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {

                  },

                  child: TextField(
                    onChanged: (value) {

                    },
                    controller: controller.yearTEController,
                    decoration: InputDecoration(
                      hintText: "Select Year",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 1,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
