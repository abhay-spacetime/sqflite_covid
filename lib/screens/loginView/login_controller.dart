import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sqlicrud_demo/database/model/user_controller.dart';
import 'package:sqlicrud_demo/database/model/user_model.dart';
import 'package:sqlicrud_demo/screens/homeView/home_controller.dart';
import 'package:sqlicrud_demo/screens/homeView/home_page.dart';

class LoginController extends GetxController {
  late final TextEditingController userNameController;
  late final TextEditingController passwordController;

  @override
  void onInit() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();

    super.onClose();
  }

  onLogin() {
    Get.put(UserModelController());
    Get.find<UserModelController>()
        .loginUser(userNameController.text, passwordController.text);
  }
}
