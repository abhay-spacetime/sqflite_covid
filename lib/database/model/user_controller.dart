import 'package:get/get.dart';
import 'package:sqlicrud_demo/database/model/user_model.dart';
import 'package:sqlicrud_demo/database/repositories/user_repository.dart';
import 'package:sqlicrud_demo/screens/homeView/home_controller.dart';
import 'package:sqlicrud_demo/screens/homeView/home_page.dart';

class UserModelController extends GetxController {
  var allUser = <UserModel>[].obs;
  UserRepository userRepository = UserRepository();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllUser();
  }

  fetchAllUser() async {
    var student = await userRepository.getUser();
    allUser.value = student;
  }

  addUser(UserModel userModel) {
    userRepository.add(userModel);
    fetchAllUser();
  }

  deleteUser(int id) {
    userRepository.delete(id);
    fetchAllUser();
  }

  loginUser(String username,String password) {
    var result = userRepository.selectUser(username,password);
    
  }
}
