import 'package:get/get.dart';

class LandingController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  redirection(String page) => Get.toNamed(page);
}
