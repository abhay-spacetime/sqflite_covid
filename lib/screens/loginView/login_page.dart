import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlicrud_demo/constance.dart';
import 'package:sqlicrud_demo/screens/loginView/login_controller.dart';
import 'package:sqlicrud_demo/screens/widgets/custom_button_icon.dart';
import 'package:sqlicrud_demo/screens/widgets/custom_text.dart';
import 'package:sqlicrud_demo/screens/widgets/custom_text_form.dart';

class LoginPage extends GetView<LoginController> {
  static String id = '/loginPage';

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
              children: const [
                CustomText(
                  text: "Welcome",
                  fontSize: 30.0,
                ),
                CustomText(
                  text: "Sign up",
                  color: primaryColor,
                  fontSize: 18,
                )
              ],
            ),
            const SizedBox(height: 10),
            const CustomText(
              text: "Sign into Continue",
              fontSize: 14.0,
              color: Colors.grey,
            ),
            const SizedBox(height: 30),
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
                text: 'Login in',
                onPress: () => controller.onLogin(),
                icon: Icon(Icons.login, color: primaryColor))
          ],
        ),
      ),
    );
  }
}
