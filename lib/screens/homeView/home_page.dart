import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlicrud_demo/constance.dart';
import 'package:sqlicrud_demo/screens/homeView/home_controller.dart';
import 'package:sqlicrud_demo/screens/widgets/custom_text.dart';

class HomePage extends GetView<HomeController> {
  static String id = '/homePage';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Home Screen',
          color: Colors.black,
          alignment: Alignment.center,
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                controller.logout();
              },
              icon: const Icon(Icons.logout, color: primaryColor))
        ],
      ),
      body: Obx(
        () => controller.loading.value == true
            ? Center(child: const CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.userController.allUser.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      child: Card(
                    child: ListTile(
                      title: Text(
                          'Name: ${controller.userController.allUser[index].firstName} ${controller.userController.allUser[index].lastName}',
                          style: const TextStyle(
                              color: Colors.blueGrey, fontSize: 20)),
                      subtitle: Text(
                          'Username: ${controller.userController.allUser[index].userName}',
                          style: const TextStyle(
                              fontSize: 18, color: Colors.grey)),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.close,
                          size: 32,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          controller.userController.deleteUser(
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
