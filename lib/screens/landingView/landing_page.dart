import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlicrud_demo/constance.dart';
import 'package:sqlicrud_demo/screens/covidView/covidpage.dart';
import 'package:sqlicrud_demo/screens/landingView/landing_controller.dart';
import 'package:sqlicrud_demo/screens/loginView/login_page.dart';
import 'package:sqlicrud_demo/screens/registrationView/registration_page.dart';
import 'package:sqlicrud_demo/screens/widgets/custom_button_icon.dart';

class LandingPage extends GetView<LandingController> {
  static String id = '/landingPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButtomIcon(
                  text: 'Login',
                  onPress: () => controller.redirection(LoginPage.id),
                  icon: Icon(Icons.login, color: primaryColor)),
              CustomButtomIcon(
                  text: 'Registration',
                  onPress: () => controller.redirection(RegistrationPage.id),
                  icon: Icon(Icons.home, color: primaryColor)),
              CustomButtomIcon(
                  text: 'Covid Records',
                  onPress: () => controller.redirection(CovidPage.id),
                  icon: Icon(Icons.coronavirus_rounded, color: primaryColor))
            ]),
      ),
    ));
  }
}
