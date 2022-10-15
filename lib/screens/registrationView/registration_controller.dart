import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlicrud_demo/screens/homeView/home_controller.dart';
import 'package:sqlicrud_demo/screens/homeView/home_page.dart';

import '../../database/model/user_controller.dart';
import '../../database/model/user_model.dart';
import '../../database/repositories/user_repository.dart';

class RegistrationController extends GetxController {
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController userNameController;
  late final TextEditingController passwordController;
  UserRepository userRepository = UserRepository();
  UserModelController userController = UserModelController();

  @override
  void onInit() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    userNameController = TextEditingController();
    passwordController = TextEditingController();

    super.onInit();
  }

  addUser(UserModel userModel) {
    userRepository.add(userModel);
    userController.fetchAllUser();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    userNameController.dispose();
    passwordController.dispose();

    super.onClose();
  }

  onRegistration() async {
    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    final userName = userNameController.text;
    final password = passwordController.text;
    if (firstNameController.text != "" &&
        lastNameController.text != "" &&
        userNameController.text != "" &&
        passwordController.text != "") {
      userController.addUser(UserModel(
          id: null,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          password: passwordController.text,
          userName: userNameController.text));
      firstNameController.text = "";
      lastNameController.text = '';
      userNameController.text = '';
      passwordController.text = '';
    }

    // nav to homePage
   Get.toNamed(HomePage.id);
  }
}

typedef OnCompose = void Function(
    String firstName, String lastName, String userName, String password);
