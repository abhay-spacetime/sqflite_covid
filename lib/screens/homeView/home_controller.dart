import 'package:get/get.dart';
import 'package:sqlicrud_demo/database/model/user_controller.dart';
import 'package:sqlicrud_demo/screens/landingView/landing_page.dart';
import 'package:sqlicrud_demo/screens/registrationView/registration_controller.dart';

import '../../database/model/user_model.dart';
import '../../database/repositories/user_repository.dart';

class HomeController extends GetxController {
  UserRepository userRepository = UserRepository();
  UserModelController userController = UserModelController();

  @override
  void onInit() {
    fetchFromSQLite();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchFromSQLite() {
    //Loading = true;
    // fetch krke data me insert
    userController.fetchAllUser();
    //Loading = false;
  }

  void navToCovidReports() {}
  void logout() {
    Get.toNamed(LandingPage.id);
  }
}
