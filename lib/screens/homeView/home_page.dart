import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sqlicrud_demo/constance.dart';
import 'package:sqlicrud_demo/screens/homeView/home_controller.dart';
import 'package:sqlicrud_demo/screens/widgets/custom_text.dart';
import '../covidView/covidpage.dart';

class HomePage extends GetView<HomeController> {
  static String id = '/homePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Home Screen',
          color: Colors.black,
          alignment: Alignment.center,
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                controller.logout();
                // Get.toNamed(CovidPage.id);
              },
              icon: Icon(Icons.logout, color: primaryColor))
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.userController.allUser.length,
          itemBuilder: (context, index) {
            return InkWell(
                child: Card(
              child: ListTile(
                title: Text(
                    'Name: ${controller.userController.allUser[index].firstName} ${controller.userController.allUser[index].lastName}',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 20)),
                subtitle: Text(
                    'Username: ${controller.userController.allUser[index].userName}',
                    style: TextStyle(fontSize: 18, color: Colors.grey)),
                trailing: IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 32,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    controller.userController.deleteStudent(
                        controller.userController.allUser[index].id!);
                  },
                ),
              ),
            ));
          },
        ),
      ),
    );
  }
}
