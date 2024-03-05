import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/controllers/AddItemPageController.dart';
import 'package:untitled2/controllers/list_controller.dart';
import 'package:untitled2/model/user_model.dart';

class AddItemPage extends GetView<AddItemPageController> {
  final ListController listController = Get.put(ListController());
  final String from;
  final UserModelItemList? userModelItemList;
  final int index;

  AddItemPage({
    super.key,
    required this.from,
    required this.userModelItemList,
    required this.index,
  }) {
    Get.put(AddItemPageController());
    if (userModelItemList != null) {
      controller.name.value = userModelItemList?.name ?? "";
      controller.age.value = userModelItemList?.age ?? 0;
      controller.nameTeController.text = userModelItemList?.name ?? "";
      controller.ageTeController.text =
          (userModelItemList?.age ?? 0).toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          Get.back(result: {"isAdded": true});
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(from == "edit" ? "Edit item" : "Add new Item"),
          ),
          body: Column(
            children: [
              Semantics(
                child: TextField(
                  controller: controller.nameTeController,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    controller.name.value = value;
                  },
                  decoration: InputDecoration(hintText: "Enter a name"),
                ),
              ),
              Semantics(
                label: "Age",
                child: TextField(
                  controller: controller.ageTeController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    try {
                      controller.age.value = int.parse(value);
                    } catch (e) {
                      e.printError();
                    }
                  },
                  decoration: InputDecoration(hintText: "Enter a Age"),
                ),
              ),
              Semantics(
                child: ElevatedButton(
                  onPressed: () {
                    var userModel = UserModelItemList(
                        name: controller.name.value, age: controller.age.value);
                    if(index != -1) {
                      listController.updateUser(index, userModel);
                    }else {
                      listController.addUser(
                       userModel
                      );
                    }
                    Get.back(result: {"isAdded": true});
                  },
                  child: Text(from == "edit" ? "update" : "Save"),
                ),
              ),
              Obx(() {
                return Text(
                    "${controller.name.value} - ${controller.age.value}");
              })
            ],
          ),
        ),
      ),
    );
  }
}
