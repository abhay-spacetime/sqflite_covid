import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlicrud_demo/constance%20copy.dart';
import 'package:sqlicrud_demo/screens/loginView/login_page.dart';
import 'package:sqlicrud_demo/screens/registrationView/registration_controller.dart';
import 'package:sqlicrud_demo/screens/widgets/custom_button_icon.dart';
import 'package:sqlicrud_demo/screens/widgets/custom_text.dart';
import 'package:sqlicrud_demo/screens/widgets/custom_text_form.dart';

class RegistrationPage extends GetView<RegistrationController> {
  static String id = '/registrationPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 80.0,
          right: 20.0,
          left: 20.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Welcome",
                  fontSize: 30.0,
                ),
                GestureDetector(
                  onTap: (() => Get.offNamed(LoginPage.id)),
                  child: CustomText(
                    text: "Sign in",
                    color: primaryColor,
                    fontSize: 18,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            const CustomText(
              text: "Registrated into Continue",
              fontSize: 14.0,
              color: Colors.grey,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              controller: controller.firstNameController,
              text: 'Firstname',
              hint: 'Alex',
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextFormField(
              controller: controller.lastNameController,
              text: 'Lastname',
              hint: 'Joe',
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextFormField(
              controller: controller.userNameController,
              text: 'Username',
              hint: 'username',
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextFormField(
              controller: controller.passwordController,
              text: 'Password',
              hint: '*******',
              flag: true,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtomIcon(
                text: 'Registration',
                onPress: () => controller.onRegistration(),
                icon: const Icon(Icons.login, color: primaryColor))
          ],
        ),
      ),
    );
  }
}
