import 'package:get/get.dart';
import 'package:sqlicrud_demo/database/model/user_controller.dart';
import 'package:sqlicrud_demo/screens/landingView/landing_page.dart';
import 'package:sqlicrud_demo/screens/registrationView/registration_controller.dart';

import '../../database/model/user_model.dart';
import '../../database/repositories/user_repository.dart';

class HomeController extends GetxController {
  UserRepository userRepository = UserRepository();
  UserModelController userController = UserModelController();
  RxBool loading = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchFromSQLite() {
    try {
      loading.value = true;
      userController.fetchAllUser();

      loading.value = false;
    } catch (e) {
      print('Error: error fetch data from database${e}');
      loading.value = false;
    } finally {
      loading.value = false;
    }
  }

  void navToCovidReports() {}
  void logout() {
    Get.toNamed(LandingPage.id);
  }
}
