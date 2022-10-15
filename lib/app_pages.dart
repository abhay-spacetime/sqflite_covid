import 'package:get/get.dart';
import 'package:sqlicrud_demo/screens/covidView/covidcontroller.dart';
import 'package:sqlicrud_demo/screens/covidView/covidpage.dart';
import 'package:sqlicrud_demo/screens/homeView/home_controller.dart';
import 'package:sqlicrud_demo/screens/landingView/landing_controller.dart';
import 'package:sqlicrud_demo/screens/loginView/login_controller.dart';
import 'package:sqlicrud_demo/screens/registrationView/registration_controller.dart';

import 'screens/homeView/home_page.dart';
import 'screens/landingView/landing_page.dart';
import 'screens/loginView/login_page.dart';
import 'screens/registrationView/registration_page.dart';

List<GetPage> pages = [
  GetPage(
    name: '/landingPage',
    page: () => LandingPage(),
    binding: BindingsBuilder(
      () => Get.lazyPut<LandingController>(() => LandingController()),
    ),
  ),
  GetPage(
    name: '/loginPage',
    page: () => LoginPage(),
    binding: BindingsBuilder(
      () => Get.lazyPut<LoginController>(() => LoginController()),
    ),
  ),
  GetPage(
    name: '/registrationPage',
    page: () => RegistrationPage(),
    binding: BindingsBuilder(
      () => Get.lazyPut<RegistrationController>(() => RegistrationController()),
    ),
  ),
  GetPage(
    name: '/homePage',
    page: () => HomePage(),
    binding: BindingsBuilder(
      () => Get.lazyPut<HomeController>(() => HomeController()),
    ),
  ),
GetPage(
    name: CovidPage.id,
    page: () => CovidPage(),
    binding: BindingsBuilder(
      () => Get.lazyPut<CovidController>(() => CovidController()),
    ),
  ),

];
