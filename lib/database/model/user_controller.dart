import 'package:get/get.dart';
import 'package:sqlicrud_demo/database/model/user_model.dart';
import 'package:sqlicrud_demo/database/repositories/user_repository.dart';

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

  addUser(UserModel studentModel) {
    userRepository.add(studentModel);
    fetchAllUser();
  }
deleteStudent(int id) {
    userRepository.delete(id);
    fetchAllUser();
  }
  
}