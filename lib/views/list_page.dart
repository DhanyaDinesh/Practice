import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:untitled2/views/add_item.dart';
import 'package:untitled2/views/details_page.dart';

import '../controllers/list_controller.dart';

class ListPage extends GetView<ListController> {
  ListPage({super.key}) {
    Get.put(ListController());

    controller.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Get.to(() => AddItemPage(
                from: "add",
                userModelItemList: null,
                index: -1,
              ));
          if (result != null) {
            log("result -> $result");
          }
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("List Page"),
      ),
      body: Obx(() {
        return ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Get.to(
                //   () => AddItemPage(
                //     from: "edit",
                //     userModelItemList: controller.userModelList[index],
                //       index: index,
                //   ),
                // );
                Get.to(() => DetailsPage
                );
              },
              child: Card(
                elevation: 3,
                color: Colors.amberAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.userModelList[index].name ?? "-"),
                      Text((controller.userModelList[index].age ?? 0)
                          .toString()),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: controller.userModelList.length,
        );
      }),
    );
  }
}
