import 'package:flutter_sqflite/model/UserModel.dart';
import 'package:flutter_sqflite/repositories/UserRepository.dart';
import 'package:get/get.dart';

class StudentViewModel extends GetxController {
  var allStudent = <UserModel>[].obs;
  UserRepository userRepository = UserRepository();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllUser();
  }

  fetchAllUser() async {
    var student = await userRepository.getUser();
    allStudent.value = student;
  }

  addUser(UserModel studentModel) {
    userRepository.add(studentModel);
    fetchAllUser();
  }

  updateStudent(UserModel studentModel) {
    userRepository.update(studentModel);
    fetchAllUser();
  }

  deleteStudent(int id) {
    userRepository.delete(id);
    fetchAllUser();
  }
}
