import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sqlicrud_demo/database/model/user_controller.dart';
import 'package:sqlicrud_demo/database/repositories/user_repository.dart';

class LandingController extends GetxController {
  static GetStorage box = GetStorage();
  UserRepository userRepository = UserRepository();
  UserModelController userController = UserModelController();
  RxBool loading = true.obs;
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  fetchData() async {
    loading.value = true;
    userController.fetchAllUser();
    var list = await userController.allUser();
    loading.value = false;
  }

  redirection(String page) => Get.toNamed(page);
}
