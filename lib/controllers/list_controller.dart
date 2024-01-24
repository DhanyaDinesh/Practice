import 'package:get/get.dart';
import 'package:untitled2/model/user_model.dart';

class ListController extends GetxController {
  final userModelList = List<UserModelItemList>.empty(growable: true).obs;

  fetchUsers() {
    userModelList.clear();
    //call api
    userModelList.clear();
    userModelList.add(UserModelItemList(name: "Dhanya", age: 23));
    userModelList.add(UserModelItemList(name: "Akash", age: 22));
    userModelList.add(UserModelItemList(name: "Vivek", age: 23));
  }

  addUser(UserModelItemList userModel)
  {
    userModelList.add(userModel);
  }
updateUser(int index,UserModelItemList userModel)
{
  userModelList[index] = userModel;
}
}
