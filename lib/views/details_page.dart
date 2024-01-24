import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:untitled2/controllers/details_page_controller.dart';
import 'package:untitled2/model/user_model.dart';

class DetailsPage extends GetView<DetailsPageController> {
 final UserModel userModel;
  const DetailsPage({super.key,required this.userModel});


  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Details Page"),
        ),
      ),
    );
  }
}
